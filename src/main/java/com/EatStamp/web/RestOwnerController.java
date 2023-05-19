package com.EatStamp.web;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.RestVO;
import com.EatStamp.service.RestOwnerService;

/**
 * restOwner controller
 * @version 1.0
 * @since 2023.05.19
 * @author 이예지
 */
@Controller
public class RestOwnerController {

	@Autowired
	private RestOwnerService restOwnerService;
	
	//메시지 전달용 객체 생성
	String message = null;
	
	
	/**
	 * <pre>
	 * 처리내용 : 사장님 페이지의 식당 수정 폼
	 * </pre>
	 * @date : 2023. 05. 19
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 19          이예지            최초작성
	 * -------------------------------------------------
	 * @param session
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateRestOwnerForm.do")
	public ModelAndView restUpdate(HttpSession session,
								   HttpServletResponse response) throws Exception{
		
		MemberVO owner = (MemberVO)session.getAttribute("owner");
		String mem_nick = owner.getMem_nick();
		
		//가게정보 받아오기
		RestVO list = restOwnerService.getRestOwnerDetail(mem_nick);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("owner/ownerRestUpdate"); 
		
		return mav;
	}//update end
	
	/**
	 * <pre>
	 * 처리내용 : 사장님 페이지의 식당 수정
	 * </pre>
	 * @date : 2023. 05. 19
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 19          이예지            최초작성
	 * -------------------------------------------------
	 * @param r_num
	 * @param real_file
	 * @param r_name
	 * @param r_tel
	 * @param r_detail
	 * @param r_add
	 * @param r_open
	 * @param r_close
	 * @param r_menu
	 * @param r_fileName
	 * @param old_fileName
	 * @param update_add
	 * @param update_add_semi
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateRestOwner.do")
	public ModelAndView updateRestOwner(@RequestParam(value = "r_num") int r_num,
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
										HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		RestVO vo = new RestVO();
		String uploadPath = "C:/Users/prend/git/ojtproject/src/main/webapp/images/restImage";
	
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
			File newFile = new File(uploadPath + "\\" + curTime + "_"  + r_name + "_" + r_fileName);
			real_file.transferTo(newFile); 	
			
			//중복 방지용
			String rest_file_name = curTime + "_" + r_name + "_" + r_fileName;
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
		
		//db에 업데이트하기 위해 나머지 값 set
		vo.setR_num(r_num);
		vo.setR_tel(r_tel);
		vo.setR_detail(r_detail);
		vo.setR_menu(r_menu);
		vo.setR_open(r_open);
		vo.setR_close(r_close);

		//service 전송
		int result = restOwnerService.updateRestOwner(vo);
		
		if(1 == result) { //업데이트 성공
			
			message = "가게 정보 수정에 성공했습니다.";
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('"+ message +"');</script>");
            out.println("<script>location.replace('ownerMypage.do');</script>");
            out.flush();
	
			return mav;
			
		}else {//업데이트 실패
			
			message = "가게 정보 수정에 실패했습니다. 다시 시도해주세요.";
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('"+ message +"');</script>");
            out.println("<script>location.reload();</script>");
            out.flush();
			
			return mav;
		}
	
	}//update end
}
