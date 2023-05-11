package com.EatStamp.service;

import java.util.List;
import java.util.Map;

public interface WordAnalysisService {
	
	//자연어 처리 - 형태소 분석 (명사만 추출하기)
	List<String> doWordNouns(String text) throws Exception;
	
	//빈도수 분석(단어별 출현 빈도수)
	Map<String, Integer> doWordCount(List<String> pList) throws Exception;
	
	//분석할 문장의 자연어 처리 및 빈도수 분석 수행
	Map<String, Integer> doWordAnalysis(String text) throws Exception;
	
	public Map<String, Integer> selectText(Map<String,Object> map) throws Exception; //분석할 텍스트 선택
//	public void insertKeyword(KeywordVO keyword); //키워드 저장
//	public List<KeywordVO> selectKeyword(Map<String,Object> map); //키워드 리스트

}
