package com.EatStamp.web;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.SearchVO;
import com.EatStamp.domain.StampVO;
import com.EatStamp.service.AdminRestService;
import com.common.utils.PagingUtil;

@Controller
public class RestControllerAdmin {
	
	@Resource(name = "adminRestService")
	public AdminRestService service;
	
	//페이징용 변수 설정
	private int rowCount = 10;
	private int pageCount = 10;
	
	//메시지 전달용 객체 생성
	String message = null;
	
	//0420 최은지 레스토랑 리스트 페이지 이동
	@RequestMapping(value = "/restListAdmin.do")
	public ModelAndView restMainGo(@RequestParam(value = "pageNum",defaultValue = "1") int currentPage) throws Exception{
		
			//맵 생성
			Map<String,Object> map = new HashMap<String, Object>();
			
			//페이징용 전체 식당 수 불러오기
			int count = service.selectRestListRowCount(map);
			
			//페이징 처리
			PagingUtil page = new PagingUtil(currentPage,count,rowCount,pageCount,"/restListAdmin.do");
			
			//리스트 생성
			List<RestVO> list = null;
			if(count > 0) {
				map.put("start", page.getStartRow());
				map.put("end", page.getEndRow());
				
				list = service.selectAdminRestList(map);
				
				map.put("list", list);
			}
		
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/restListAdmin");
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("page", page.getPage());
			
			return mav;		

	} //restMainGo end
	
		
	//0420 최은지 레스토랑 리스트 검색
		@RequestMapping(value = "/goRestSearchAdmin.do")
		public ModelAndView restSearchGo(@RequestParam(value = "pageNum",defaultValue = "1") int currentPage,
														@RequestParam(value = "search_keyword",defaultValue = "") String search_keyword,
														@RequestParam(value = "field",defaultValue = "") String field) throws Exception{
			
			//맵 생성
			Map<String,Object> map = new HashMap<String, Object>();
			
			map.put("field", field);
			map.put("search_keyword", search_keyword);
			
			//페이징용 검색결과 식당 수 불러오기
			int count = service.selectSearchRestListRowCount(map);
			
			//페이징 처리
			PagingUtil page = new PagingUtil(currentPage,count,rowCount,pageCount,"/goRestSearchAdmin.do");
			
			//리스트 생성
			List<SearchVO> list = null;
			if(count > 0) {
				map.put("start", page.getStartRow());
				map.put("end", page.getEndRow());
				
				list = service.selectSearchRestList(map);
				
				map.put("list", list);
			}
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("admin/restSearchListAdmin"); 
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("field", field);
			mav.addObject("search_keyword", search_keyword);
			mav.addObject("page", page.getPage());
			
			return mav;		
		}//restSearchGo end
		
		
		//0421 최은지 가게 상세 페이지
		@RequestMapping(value = "/restAdminDetail.do")
		public ModelAndView restAdminDetailGo(@RequestParam(value = "r_num") int r_num) throws Exception{
			
			ModelAndView mav = new ModelAndView();
			
			//vo객체 생성해서 조회할 r_num값 set
			RestVO vo = new RestVO();
			vo.setR_num(r_num);
			
			//가게정보 받아오기
			RestVO list = service.getRestDetailList(vo);
			
			mav.addObject("r_num", r_num);
			mav.addObject("list", list);
			mav.setViewName("admin/restDetailAdmin"); 
			
			return mav;
		}//restSearchGo end
		
		
		//0424 최은지 가게 비공개
		@RequestMapping(value = "/restBlock.do")
		public ModelAndView restUnblock(@RequestParam(value = "r_num") int r_num,
														HttpServletResponse response) throws Exception{
			
			ModelAndView mav = new ModelAndView();
			
			//가게 공개 여부 업데이트
			int result = service.goRestBlock(r_num);
			
			if(1 == result) { //비공개에 성공했다면
				            
				//vo객체 생성해서 조회할 r_num값 set
				RestVO vo = new RestVO();
				vo.setR_num(r_num);
				
				//가게정보 받아오기(재로딩용)
				RestVO list = service.getRestDetailList(vo);
				
				mav.addObject("r_num", r_num);
				mav.addObject("list", list);
	        	mav.setViewName("admin/restDetailAdmin"); 
				
				message = "해당 가게가 비공개 처리되었습니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
	        	
				return mav;
		
			}else { //비공개에 실패했다면 
				message = "비공개 처리에 실패했습니다. 다시 시도해주세요.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
	            
	        	mav.setViewName("admin/restDetailAdmin"); 
	        	
				return mav;
			}
		}//unblock end
		
		
		//0424 최은지 가게 공개
		@RequestMapping(value = "/restUnBlock.do")
		public ModelAndView restblock(@RequestParam(value = "r_num") int r_num,
														HttpServletResponse response) throws Exception{

			ModelAndView mav = new ModelAndView();
			
			//가게 공개 여부 업데이트
			int result = service.goRestUnblock(r_num);
			
			if(1 == result) { //공개에 성공했다면
				            
				//vo객체 생성해서 조회할 r_num값 set
				RestVO vo = new RestVO();
				vo.setR_num(r_num);
				
				//가게정보 받아오기(재로딩용)
				RestVO list = service.getRestDetailList(vo);
				
				mav.addObject("r_num", r_num);
				mav.addObject("list", list);
	        	mav.setViewName("admin/restDetailAdmin"); 
				
				message = "해당 가게가 공개 처리되었습니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
	        	
				return mav;
		
			}else { //비공개에 실패했다면 
				message = "공개 처리에 실패했습니다. 다시 시도해주세요.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
	            
	        	mav.setViewName("admin/restDetailAdmin"); 
	        	
				return mav;
			}
		}//unblock end
		
		
		//0424 최은지 가게 정보 삭제
		@RequestMapping(value = "/restDelete.do")
		public ModelAndView restDelete(@RequestParam(value = "r_num") int r_num,
														HttpServletResponse response) throws Exception{
			
			ModelAndView mav = new ModelAndView();
			
			//가게 삭제
			int result = service.restDelete(r_num);
			
			if(1 == result) { //가게 삭제 성공
				
				message = "해당 가게의 정보가 삭제되었습니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.println("<script>location.replace('/restListAdmin.do');</script>");
	            out.flush();
	            
				return mav;
				
			}else {  //가게 삭제 실패
			
				message = "정보 삭제에 실패했습니다. 다시 사도해주세요.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.println("<script>history.back()</script>");
	            out.flush();

				return mav;
			}
		}//delete end
		
		
		//0424 최은지 가게 정보 수정
		@RequestMapping(value = "/restUpdate.do")
		public ModelAndView restUpdate(@RequestParam(value = "r_num") int r_num,
														HttpServletResponse response) throws Exception{
			
			ModelAndView mav = new ModelAndView();
			
			//기존 정보 제공용 list 불러오기
			RestVO vo = new RestVO();
			vo.setR_num(r_num);
			
			//가게정보 받아오기
			RestVO list = service.getRestDetailList(vo);
			
			mav.addObject("r_num", r_num);
			mav.addObject("list", list);
		
			mav.setViewName("admin/restUpdateAdmin"); 
			
			return mav;
		}//update end
		
			
		//0424 최은지 가게 정보 수정 비즈니스 로직
		@RequestMapping(value = "/updateRestContent.do")
		public ModelAndView restContentUpdate(@RequestParam(value = "r_num") int r_num,
																	@RequestParam(value = "img_route") MultipartFile real_file,
																	@RequestParam(value = "r_name") String r_name,
																	@RequestParam(value = "r_tel") String r_tel,
																	@RequestParam(value = "r_detail") String r_detail,
																	@RequestParam(value = "r_add") String r_add,
																	@RequestParam(value = "r_open") String r_open,
																	@RequestParam(value = "r_close") String r_close,
																	@RequestParam(value = "r_menu") String r_menu,
																	@RequestParam(value = "r_fileName") String r_fileName, //새로 등록한 파일네임
																	@RequestParam(value = "old_fileName") String old_fileName, //기존 파일네임
																	@RequestParam(value = "update_add") String update_add,
																	@RequestParam(value = "update_add_semi") String update_add_semi,
																	MultipartHttpServletRequest request,
																	HttpServletResponse response) throws Exception{ //시간나면 폼 데이터 한번에 받아오는 걸로 변경
				
			ModelAndView mav = new ModelAndView();
			RestVO vo = new RestVO();
			String uploadPath = "C:/Users/shush/git/ojtproject/src/main/webapp/images/restImage";
		
			//1. 이미지 파일 변경 여부 확인
			if(r_fileName.equals("") ) { //새로 등록한 파일이 없다면
				vo.setR_fileName(old_fileName); //구 파일명 set
				
			}else {//새로 등록한 파일이 있다면 
				
				//날짜 확인용 객체 생성
				String curTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
				
				//예전 이미지 파일 삭제
				File oldFile = new File(uploadPath + "\\" + old_fileName);
                if (oldFile.exists()) {
                    oldFile.delete();
                }
				
                //신규 파일 등록
				File newFile = new File(uploadPath+"\\"+curTime+ "_"  +r_name+ "_"  +r_fileName);
				real_file.transferTo(newFile); 	
				
				//중복 방지용
				String rest_file_name = curTime+"_" +r_name+"_" +r_fileName;
				vo.setR_fileName(rest_file_name); //신 파일명 set
			}
			
			//2. 주소 변경 여부 확인
			if(update_add.equals("")){ //신규 주소등록이 비어있다면
				//기존 주소를 set				
				vo.setR_add(r_add);
			}else {//신규 주소등록 값이 있다면
				String plus_add = update_add + " " +update_add_semi;
				//메인 주소와 서브 주소를 합친 값을 set
				vo.setR_add(plus_add);
			}
			
			//개행문자 처리 > db저장값 + 출력값 확인하기
			//String detail_contents = r_detail.replace("\r\n","<br>");
			//String menu_contents = r_menul.replace("\r\n","<br>");
			
			//db에 업데이트하기 위해 나머지 값 set
			vo.setR_num(r_num);
			vo.setR_name(r_name);
			vo.setR_tel(r_tel);
			vo.setR_detail(r_detail);
			vo.setR_menu(r_menu);
			vo.setR_open(r_open);
			vo.setR_close(r_close);
	
			//service 전송
			int result = service.restUpdate(vo);
			
			if(1 == result) { //업데이트 성공
				
				message = "가게 정보 수정에 성공했습니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.println("<script>location.replace('/restAdminDetail.do?r_num="+r_num+"');</script>");
	            out.flush();
		
				return mav;
				
			}else {//업데이트 실패
				
				message = "가게 정보 수정에 실패했습니다. 다시 시도해주세요.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.println("<script>location.replace('restAdminDetail.do?r_num=" + r_num + "');</script>");
	            out.flush();
				
				return mav;
			}
		
		}//update end
		
		
		//0427 최은지 가게 등록 페이지 이동
		@RequestMapping(value = "/restInsert.do")
		public String restInsertGo(HttpServletResponse response) throws Exception{
			
			return "admin/restInsertAdmin";
		}//restSearchGo end

		
		//0427 최은지 가게 등록 페이지
		@RequestMapping(value = "/insertRestContent.do")
		public ModelAndView restContentInsert(@RequestParam(value = "img_route") MultipartFile real_file, //확인
																@RequestParam(value = "r_name") String r_name, //확인
																@RequestParam(value = "r_tel") String r_tel, //확인
																@RequestParam(value = "r_detail") String r_detail, //확인
																@RequestParam(value = "r_food") String r_food, //확인
																@RequestParam(value = "r_category") String r_category, //확인
																@RequestParam(value = "r_open") String r_open, //확인
																@RequestParam(value = "r_close") String r_close, //확인
																@RequestParam(value = "r_menu") String r_menu, //확인
																@RequestParam(value = "r_fileName") String r_fileName, //확인
																@RequestParam(value = "update_add") String update_add, //확인
																@RequestParam(value = "update_add_semi") String update_add_semi, //확인
																MultipartHttpServletRequest request,
																HttpServletResponse response) throws Exception{
			
					ModelAndView mav = new ModelAndView();
					RestVO vo = new RestVO();
					String uploadPath =  "C:/Users/shush/git/ojtproject/src/main/webapp/images/restImage";
					
					
					//날짜 확인용 객체 생성
					String curTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
					
		            //신규 파일 등록
					File newFile = new File(uploadPath+"\\"+curTime+ "_"  +r_name+ "_"  +r_fileName);
					real_file.transferTo(newFile); 	
					
					//중복 방지용
					String rest_file_name = curTime+"_" +r_name+"_" +r_fileName;
					vo.setR_fileName(rest_file_name); //신 파일명 set
					
					//메인 주소와 서브 주소를 합친 값
					String plus_add = update_add + " " +update_add_semi;
					
					vo.setR_add(plus_add);
					vo.setR_name(r_name);
					vo.setR_tel(r_tel);
					vo.setR_detail(r_detail);
					vo.setR_menu(r_menu);
					vo.setR_open(r_open);
					vo.setR_close(r_close);
					vo.setR_food(r_food);
					vo.setR_category(r_category);
					
					//service에 전송
					int result = service.restInsert(vo);
					
					if(1 == result) {//등록에 성공했다면

						int r_num = vo.getR_num(); 
						
						message = "가게 정보 등록에 성공했습니다.";
			            response.setContentType("text/html; charset=UTF-8");
			            PrintWriter out = response.getWriter();
			            out.println("<script>alert('"+ message +"');</script>");
			            out.println("<script>location.replace('/restListAdmin.do');</script>");
			            out.flush();
			            
						return mav;
					}else { //등록 실패
						
						message = "가게 정보 등록에 실패했습니다. 다시 시도해주세요.";
			            response.setContentType("text/html; charset=UTF-8");
			            PrintWriter out = response.getWriter();
			            out.println("<script>alert('"+ message +"');</script>");
			            out.flush();
			            
			            mav.setViewName("admin/restInsertAdmin");
						
						return mav;
					}
					
				}//restInsert end

}
