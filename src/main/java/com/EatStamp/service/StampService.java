package com.EatStamp.service;

import java.util.List;
import java.util.Map;

import com.EatStamp.domain.CmtVO;
import com.EatStamp.domain.StampVO;


public interface StampService {
	
	public List<StampVO> selectList(Map<String,Object> map) throws Exception; //내 글 목록
	
	public int selectRowCount(Map<String,Object> map) throws Exception; //Stamp 개수 구하기
	
	public void insertStamp(StampVO stamp) throws Exception; //글쓰기
	
	public StampVO selectStamp(Integer s_num) throws Exception; //글선택
	
	public void updateStamp(StampVO stamp) throws Exception; //글수정
	
	public void deleteStamp(Integer s_num) throws Exception; //글삭제
	
	public List<StampVO> selectAllList(Map<String, Object> map) throws Exception; //전체 글 목록
	
	public int selectAllRowCount(Map<String, Object> map) throws Exception; //전체 글 목록 개수 구하기
	
	public void updateViewCnt(Integer s_num) throws Exception; //조회수 증가
	
	//댓글
	public int selectCmtCount(Integer s_num) throws Exception; //댓글 개수 구하기
		
	public void insertCmt(CmtVO cmt) throws Exception; //댓글 작성
	
	public List<CmtVO> selectCmtAllList(Map<String, Object> map) throws Exception; //내가 작성한 댓글 목록
	
	public int selectMyCmtCount(Integer mem_num) throws Exception; //내가 작성한 댓글 개수
	
	public List<CmtVO> selectCmtList(Integer s_num) throws Exception; //글에 달린 댓글 목록
	
	public CmtVO selectCmt(Integer cmt_num) throws Exception; //댓글 선택
	
	public void updateCmt(CmtVO cmt) throws Exception; //댓글 수정
	
	public void deleteCmt(Integer cmt_num) throws Exception; //댓글 삭제
	
	public void deleteCmtBySNum(Integer s_num) throws Exception; //부모글 삭제 시 댓글 삭제
}