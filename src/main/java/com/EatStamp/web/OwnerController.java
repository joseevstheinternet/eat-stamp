package com.EatStamp.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.EatStamp.service.OwnerService;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
@Controller
public class OwnerController {
	
	/* logger 사용*/
	private static final Logger logger = LoggerFactory.getLogger(OwnerController.class);
	/*한 페이지에 출력되는 게시물 수*/
	private final int ROW_COUNT = 10;
	/*한 페이지에 보여줄 페이지 수*/
	private final int PAGE_COUNT = 10;
	/*메시지 문자 */
	private String message = null;
	/*서비스 빈 주입 */
	@Resource(name = "ownerService")
	public OwnerService ownerService;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 로그인 페이지로 이동
	 * </pre>
	 * @date : 2023.05.12
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.12					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 */
	@RequestMapping(value = "/loginOwner.do")
	public String test() {
		
		return "/owner/ownerLogin";
	}
	
}
