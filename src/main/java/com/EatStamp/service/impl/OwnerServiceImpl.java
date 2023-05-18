package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.SearchVO;
import com.EatStamp.mapper.MemberMapper;
import com.EatStamp.mapper.OwnerMapper;
import com.EatStamp.service.OwnerService;

import egovframework.example.cmmn.MailHandler;
import egovframework.example.cmmn.TempKey;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
@Service("ownerService")
public class OwnerServiceImpl implements OwnerService {
	
	/* 매퍼 빈 주입 */
	@Resource(name = "ownerMapper")
	private OwnerMapper ownerMapper;
	
	/* 매퍼 빈 주입 */
	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	/* 메일 전송 빈 주입 */
	@Autowired
	private JavaMailSender mailSender;
	
	/* 메일 전송 메시지 문자  */
	String mailMessage = null;
	
	/* 메일 발신자  */
	String mailTitle = "[EatStamp 인증메일 입니다.]";
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 로그인 처리
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
	@Override
	public MemberVO selectOwnerInfoLoginCheck( MemberVO vo ) throws Exception {
			
		return ownerMapper.selectLoginOwnerInforCheck( vo );
	}


	@Override
	public MemberVO selectOwnerPW( MemberVO memberVO ) throws Exception {
		return ownerMapper.selectOwnerPW( memberVO );
	}


	@Override
	public int updateOwnerPW( MemberVO memberVO ) throws Exception {
		return ownerMapper.updateOwnerPW( memberVO );
	}


	@Override
	public int selectRestRowCount( Map<String, Object> map ) throws Exception {
		return ownerMapper.selectCountOwnerSignUpRestResult(map);
	}


	@Override
	public List<SearchVO> selectRestList( Map<String, Object> map ) throws Exception {
		return ownerMapper.selectOwnerSignUpRestResult(map);
	}


	@Override
	public RestVO getDuplSignUpCheck( String r_name ) throws Exception {
		return ownerMapper.getDuplSignUpCheck(r_name);
	}


	@Override
	public int insertOwnerSignUpInfo( MemberVO memberVO ) throws Exception {
		return ownerMapper.insertOwnerSignUpInfo(memberVO);
	}

	@Override
	public int updateRestInfoSignUp( RestVO restVO ) throws Exception {
		return ownerMapper.updateRestInfoSignUp(restVO);
	}


	@Override
	public void ownerOriginSignUpEmailSend( MemberVO memberVO ) throws Exception {

		/* 메일 전송 객체 생성 */
        MailHandler sendMail = new MailHandler( mailSender );
        /* 랜덤키 길이 설정 문자 */
        String mail_key = new TempKey().getKey( 30, false ); 
        
        memberVO.setMem_mail_key( mail_key );  //랜덤키를 mail_key 컬럼에 input
        memberMapper.update_mail_key( memberVO ); //메일 키 컬럼 update

        mailMessage =  "<h1>EatStamp 사장님 메일 인증</h1>" +
        						"<br>EatStamp에 오신 것을 환영합니다!" +
        						"<br>아래 [이메일 인증 확인]을 눌러주신 후, 관리자 승인 이메일이 전송될 때까지 기다려주세요." +
        						"<br>관리자 확인 이메일은 일주일 이내 해당 메일로 발송됩니다." +
        						"<br><a href='http://localhost:8282/registerEmail.do?mem_email=" + memberVO.getMem_email() + "&mem_mail_key=" + mail_key + "' target='_blank'>이메일 인증 확인</a>";
    
        sendMail.setSubject( mailTitle );
        sendMail.setText( mailMessage );
        sendMail.setFrom( "ejchoiedsk@gmail.com", "EatStamp" );
        sendMail.setTo( memberVO.getMem_email() );
        sendMail.send();
	}


	@Override
	public int insertOwnerSignUpNewRestInfo( RestVO restVO ) throws Exception {
		return ownerMapper.insertOwnerSignUpNewRestInfo( restVO );
	}


	@Override
	public MemberVO getMemNickEqualRestName( String mem_nick ) throws Exception {
		return ownerMapper.getMemNickEqualRestName( mem_nick );
	}


	@Override
	public int getCountUnidentifiedAlert( int r_num ) throws Exception {
		return ownerMapper.getCountUnidentifiedAlert( r_num );
	}
	
	
}
