package com.EatStamp.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.service.MemberService;
import com.EatStamp.service.RestService;
import com.EatStamp.service.StampService;
import com.EatStamp.service.TagService;
import com.EatStamp.domain.StampVO;
import com.common.utils.PagingUtil;
import com.common.utils.StringUtil;
import com.google.gson.Gson;
import com.EatStamp.domain.CmtVO;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;
import com.EatStamp.domain.RestVO;

@Controller
public class StampController {
	private static final Logger logger = LoggerFactory.getLogger(StampController.class);
	private int rowCount = 5;
	private int pageCount = 10;
	
	@Autowired
	private StampService stampService;
	
	@Autowired
	private RestService restService;
	
	@Autowired
	private TagService tagService;
	
	@Autowired
	private MemberService memberService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StampVO initCommand() {
		return new StampVO();
	}
	
	//======글 등록=======//
	
	//등록 폼
	@GetMapping("/stamp/write2.do")
	public String writeForm() throws Exception {
		return "stamp/write";
	}
	
	//등록 폼에서 전송된 데이터 처리
	@PostMapping("/stamp/upload_ok.do")
	@ResponseBody
	public String upload(MultipartFile file, String s_title, String s_content, 
						int s_rate, String r_name, String s_tag, int s_publicCode, HttpSession session) throws Exception {
		try {
			int mem_num = ((MemberVO)session.getAttribute("member")).getMem_num();
			
			//날짜별로 폴더를 생성해서 파일을 관리
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String fileLoca = sdf.format(date);
			
			//저장할 폴더 경로
			String uploadPath = "C:/Users/prend/git/ojtproject/src/main/webapp/images/imageUpload/upload" + fileLoca;
			
			File folder = new File(uploadPath);
			if(!folder.exists()) {
				folder.mkdir(); //폴더가 존재하지 않는다면 생성
			}
			
			String fileRealName = file.getOriginalFilename();
			
			//파일명을 고유한 랜덤 문자로 생성
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			
			//확장자 추출
			String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
			
			System.out.println("저장할 폴더 경로: " + uploadPath);
			System.out.println("실제 파일명: " + fileRealName);
			System.out.println("폴더명: " + fileLoca);
			System.out.println("확장자: " + fileExtension);
			System.out.println("고유랜덤문자: " + uuids);
			
			String fileName = uuids + fileExtension;
			System.out.println("변경해서 저장할 파일명: " + fileName);
			
			//업로드한 파일을 서버의 지정한 경로 내에 실제로 저장
			File saveFile = new File(uploadPath + "\\" + fileName);
			file.transferTo(saveFile);
						
			//DB에 insert 작업을 진행
			StampVO stamp = new StampVO();
			
			//s_title, s_content, uploadPath, fileLoca, fileName, fileRealName, null, 0, mem_num
			
			stamp.setS_title(s_title);
			stamp.setS_content(s_content);
			stamp.setS_uploadPath(uploadPath);
			stamp.setS_fileLoca(fileLoca);
			stamp.setS_fileName(fileName);
			stamp.setS_fileRealName(fileRealName);
			stamp.setReg_date(null);
			stamp.setS_rate(s_rate);
			stamp.setR_name(r_name);
			stamp.setMem_num(mem_num);
			stamp.setS_tag(s_tag);
			stamp.setS_publicCode(s_publicCode);
			
			System.out.println(stamp);
			
			stampService.insertStamp(stamp);
			
			//생성된 stamp에서 태그 리스트 생성하기
			tagService.createTagList(stamp);

			return "success";
			
		} catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "fail"; //에러가 났을 시에는 실패 키워드 반환
		}
	}
	

	//게시글의 이미지 파일 전송 요청
	//ResponseEntity: 응답으로 변환될 정보를 모두 담은 요소들을 객체로 만들어서 반환해 줌
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) throws IOException{
		
		System.out.println("fileName: " + fileName);
		System.out.println("fileLoca: " + fileLoca);
		
		File file = new File("C:/Users/prend/git/ojtproject/src/main/webapp/images/imageUpload/upload" + fileLoca + "\\" + fileName);
		System.out.println(file);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		//probeContentType: 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메서드
		//사용자에게 보여 주고자 하는 데이터가 어떤 파일인지를 검사해서 응답 상태 코드를 다르게 리턴할 수도 있음
		headers.add("Content-Type", Files.probeContentType(file.toPath()));
		
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		
		return result;
	}
	
	//상호명 검색 폼
	@GetMapping("/stamp/rest.do")
	public String restForm() {
		return "stamp/rest";
	}
	
	//상호명 검색 폼에서 전송된 데이터 처리
	@PostMapping(value = "/stamp/rest_ok.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String rest_ok(String r_name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", r_name);
		
		//int count = restService.selectR_nameRowCount(map);

		List<RestVO> list = restService.selectR_nameList(map);
		
		StringBuilder sb = new StringBuilder();
		if (list != null && list.size() > 0) {
			sb.append("<table>");
			sb.append("<tbody>");
			for (RestVO rest : list) {
				sb.append("<tr><td>")
				  .append("<a href=\"javascript:setParentText('").append(rest.getR_name()).append("');\">")
				  .append(rest.getR_name())
				  .append("</a></td></tr>")
				  .append("<tr><td>").append(rest.getR_add()).append("/ ").append(rest.getR_category()).append("</td></tr>");
			}
			sb.append("</tbody></table>");
		} else {
			sb.append("<p>검색 결과를 찾을 수 없습니다.</p>");
		}

		return sb.toString();
	}
	
	
	
	
	//======글 목록=======//
	@RequestMapping("/stamp/list.do")
	public ModelAndView process(
			HttpSession session,
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield) throws Exception {
		
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("mem_num", user.getMem_num());
		
		//글의 총개수(검색된 글의 개수)
		int count = stampService.selectRowCount(map);
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(currentPage,count,rowCount,pageCount,"/stamp/list.do");
		
		List<StampVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = stampService.selectList(map);
			
			map.put("list", list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stamp/list");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//========글상세===========//
	@RequestMapping("/stamp/detail.do")
	public ModelAndView detail(@RequestParam int s_num, HttpSession session) throws Exception {

		logger.debug("<<s_num>> : " + s_num);
		StampVO stamp = stampService.selectStamp(s_num);
		stampService.updateViewCnt(s_num);
		int cmtCnt = stampService.selectCmtCount(s_num);
		
		MemberVO member = (MemberVO) session.getAttribute("member");

		// 제목에 태그를 허용하지 않음
		stamp.setS_title(StringUtil.useBrNoHtml(stamp.getS_title()));

		// 뷰 이름 속성명 속성값
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stamp/detail");
		mav.addObject("stamp", stamp);
		mav.addObject("member", member);
		mav.addObject("cmtCnt", cmtCnt);
		
		return mav;
	}
	
	//===========댓글 목록=============//
	@RequestMapping("/stamp/listCmt.do")
	@ResponseBody
	public String listCmt(@RequestParam int s_num, HttpSession session) throws Exception {
				
		//해당 글에 달린 댓글 개수 조회
		int cmt = stampService.selectCmtCount(s_num);
		
		// 댓글의 개수가 0보다 크다면 댓글 목록을 조회, 그렇지 않다면 빈 목록을 반환
        List<CmtVO> list = (cmt > 0) ? stampService.selectCmtList(s_num) : Collections.emptyList();
		
		Map<String, Object> mapAjax = new HashMap<>();
		mapAjax.put("cmt", cmt);
		mapAjax.put("cmtList", list);
		
		//로그인한 회원정보 세팅
		MemberVO user = (MemberVO)session.getAttribute("member");
		if(user!=null) {
			mapAjax.put("mem_num", user.getMem_num());
		}
		
		String jsonData = new Gson().toJson(mapAjax);
				
		return jsonData;
	}

	
	//===========게시판 글수정===========//
	//수정 폼
	@GetMapping("/stamp/update={s_num}.do")
	public String editForm(@PathVariable int s_num, Model model) throws Exception {
	    StampVO stamp = stampService.selectStamp(s_num);
	    model.addAttribute("stamp", stamp);
	    return "stamp/update";
	}

	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/stamp/update_ok.do")
	@ResponseBody
	public String update(MultipartFile file, int s_num, String s_title, String s_content, int s_rate, String r_name, 
							String s_tag, int s_publicCode, HttpSession session) {
	    try {
	        int mem_num = ((MemberVO)session.getAttribute("member")).getMem_num();
	        StampVO stamp = stampService.selectStamp(s_num);

	        // 기존 파일 정보 가져오기
	        String oldUploadPath = stamp.getS_uploadPath();
	        //String oldFileLoca = stamp.getS_fileLoca();
	        String oldFileName = stamp.getS_fileName();

	        if (file != null && !file.isEmpty()) {
	            // 기존 파일 삭제
	            if (oldFileName != null && !oldFileName.isEmpty()) {
	                File oldFile = new File(oldUploadPath + "\\" + oldFileName);
	                if (oldFile.exists()) {
	                    oldFile.delete();
	                }
	            }

	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	            Date date = new Date();
	            String fileLoca = sdf.format(date);

	            String uploadPath = "C:/Users/prend/git/ojtproject/src/main/webapp/images/imageUpload/upload" + fileLoca;

	            File folder = new File(uploadPath);
	            if (!folder.exists()) {
	                folder.mkdir();
	            }

	            String fileRealName = file.getOriginalFilename();

	            UUID uuid = UUID.randomUUID();
	            String uuids = uuid.toString().replaceAll("-", "");

	            String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());

	            String fileName = uuids + fileExtension;

	            File saveFile = new File(uploadPath + "\\" + fileName);
	            file.transferTo(saveFile);

	            stamp.setS_uploadPath(uploadPath);
	            stamp.setS_fileLoca(fileLoca);
	            stamp.setS_fileName(fileName);
	            stamp.setS_fileRealName(fileRealName);
	        }

	        stamp.setS_title(s_title);
	        stamp.setS_content(s_content);
	        stamp.setS_rate(s_rate);
	        stamp.setR_name(r_name);
	        stamp.setMem_num(mem_num);
	        stamp.setS_tag(s_tag);
	        stamp.setS_publicCode(s_publicCode);

	        stampService.updateStamp(stamp);

	        return "success";

	    } catch (Exception e) {
	        System.out.println("업데이트 중 에러 발생: " + e.getMessage());
	        return "fail";
	    }
	}
	
	//==========게시판 글삭제==========//
	@RequestMapping("/stamp/delete.do")
	public String submitDelete(
			       @RequestParam int s_num,
			       Model model,
			       HttpServletRequest request) throws Exception {
		
		logger.debug("<<글 삭제>> : " + s_num);
		
		//s_num을 기반으로 관련 태그 정보 삭제
		tagService.deleteTagPost(s_num);
		
		//댓글이 존재하면 댓글 삭제
		stampService.deleteCmtBySNum(s_num);
		
		//글삭제
		stampService.deleteStamp(s_num);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 삭제 완료");
		model.addAttribute("url", 
				request.getContextPath()+"/stamp/list.do");
		
		return "common/resultView";
	}
	
	
	//===========댓글 등록===========//
	@RequestMapping("/stamp/writeCmt.do")
	@ResponseBody
	public String writeCmt(@RequestParam int s_num, String cmt_content, 
				HttpSession session, HttpServletRequest request) throws Exception {
		
		try {
			int mem_num = ((MemberVO)session.getAttribute("member")).getMem_num();
			
			CmtVO cmt = new CmtVO();
			
			cmt.setCmt_content(cmt_content);
			cmt.setReg_date(null);
			cmt.setCmt_ip(request.getRemoteAddr());
			cmt.setS_num(s_num);
			cmt.setMem_num(mem_num);
						
			stampService.insertCmt(cmt);
			
			return "success";
		} catch (Exception e) {
			logger.error("댓글 등록 중 에러 발생: ", e);
			return "fail";
		}
	}
	
	
	//===========댓글 수정===========//
	@RequestMapping("/stamp/updateCmt.do")
	@ResponseBody
	public String modifyCmt(@RequestParam int cmt_num, String cmt_content, 
				HttpSession session, HttpServletRequest request) throws Exception {
		
		try {
			CmtVO cmt = stampService.selectCmt(cmt_num);
			
			cmt.setCmt_content(cmt_content);
			cmt.setReg_date(null);
			
			stampService.updateCmt(cmt);
			
			return "success";
		} catch (Exception e) {
			logger.error("댓글 수정 중 에러 발생: ", e);
	        return "fail";
		}
	}
	
	
	//===========댓글 삭제===========//
	@RequestMapping("/stamp/deleteCmt.do")
	@ResponseBody
	public String deleteCmt(@RequestParam int cmt_num) throws Exception {
		
		try {
			stampService.deleteCmt(cmt_num);
			
			return "success";
		} catch (Exception e) {
			logger.error("댓글 삭제 중 에러 발생: ", e);
	        return "fail";
		}
	}
	
	
	//=========전체 글 목록========//
	@RequestMapping("/stamp/allList.do")
	public ModelAndView allList(
			HttpSession session, 
			@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword) throws Exception {
		
		int rowCount = 10;
		
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		Map<String,Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		map.put("mem_num", user.getMem_num());
		
		//글의 총개수(검색된 글의 개수)
		int count = stampService.selectAllRowCount(map);
		logger.debug("<<count>> : " + count);
		
		
		//페이지 처리
		PagingUtil page =
				new PagingUtil(currentPage, count, rowCount, pageCount, "/stamp/allList.do");
		
		List<StampVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = stampService.selectAllList(map);
			
			map.put("list", list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stamp/allList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//======내가 쓴 댓글 목록=======//
	@RequestMapping("/stamp/myCmtList.do")
	public ModelAndView cmtList(
			HttpSession session,
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage) throws Exception {
		
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_num", user.getMem_num());
		
		//내가 쓴 댓글의 총개수
		int count = stampService.selectMyCmtCount(user.getMem_num());
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(currentPage,count,rowCount,pageCount,"/stamp/cmtList.do");
		
		List<CmtVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = stampService.selectCmtAllList(map);
			
			map.put("list", list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stamp/cmtList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//======글 신고하기 창(모달)=======//
	@RequestMapping("/stamp/selectStampReportInfo.do")
	@ResponseBody
	public String stampReport(@RequestParam int s_num, HttpSession session) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		map.put("s_num", s_num);
		
		//로그인한 회원정보 세팅
		MemberVO user = (MemberVO)session.getAttribute("member");
		if(user!=null) {
			map.put("mem_num", user.getMem_num());
		}
		
		ReportVO report = memberService.selectStampReportInfo(map);
		
		String jsonData = new Gson().toJson(report);
		
		return jsonData;
	}
	
	//======글 신고하기 등록=======//
	@RequestMapping("/stamp/reportStamp.do")
	@ResponseBody
	public String reportStamp(@RequestParam int s_num, int mem_num, String report_why, String link, HttpSession session) throws Exception{
		
		try {
			int mem_num2 = ((MemberVO)session.getAttribute("member")).getMem_num();
			
			ReportVO report = new ReportVO();
			
			report.setMem_num(mem_num);
			report.setS_num(s_num);
			report.setReport_why(report_why);
			report.setMem_num2(mem_num2);
			report.setReport_link(link);
						
			memberService.insertStampReport(report);
			
			return "success";
		} catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "fail";
		}
	}
	
	//======댓글 신고하기 창(모달)=======//
	@RequestMapping("/stamp/selectCmtReportInfo.do")
	@ResponseBody
	public String cmtReport(@RequestParam int cmt_num, HttpSession session) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		map.put("cmt_num", cmt_num);
		
		//로그인한 회원정보 세팅
		MemberVO user = (MemberVO)session.getAttribute("member");
		if(user!=null) {
			map.put("mem_num", user.getMem_num());
		}
		
		ReportVO report = memberService.selectCmtReportInfo(map);
		
		String jsonData = new Gson().toJson(report);
		
		return jsonData;
	}
	
	//======댓글 신고하기 등록=======//
	@RequestMapping("/stamp/reportCmt.do")
	@ResponseBody
	public String reportMember(@RequestParam int cmt_num, int mem_num, String report_why, String link, HttpSession session) throws Exception{
		
		try {
			int mem_num2 = ((MemberVO)session.getAttribute("member")).getMem_num();
			
			ReportVO report = new ReportVO();
			
			report.setMem_num(mem_num);
			report.setCmt_num(cmt_num);
			report.setReport_why(report_why);
			report.setMem_num2(mem_num2);
			report.setReport_link(link);
						
			memberService.insertCmtReport(report);
			
			return "success";
		} catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "fail";
		}
	}
}