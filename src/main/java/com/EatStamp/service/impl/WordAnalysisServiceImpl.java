package com.EatStamp.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import java.util.HashSet;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import com.EatStamp.service.WordAnalysisService;
import com.EatStamp.domain.KeywordVO;
import com.EatStamp.domain.StampVO;
import com.EatStamp.domain.WordVO;
import com.EatStamp.mapper.KeywordMapper;
import com.EatStamp.mapper.MemberMapper;

@Service("WordAnalysisService")
public class WordAnalysisServiceImpl implements WordAnalysisService{
	
	@Resource(name = "keywordMapper")
	private KeywordMapper keywordMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//자연어 처리 - 형태소 분석기인 Komoran를 메모리에 올리기 위해 WordAnalysisService 클래스 내 전역 변수로 설정합니다.
	Komoran nlp = null;
	
	//생성자 사용함 - 톰켓에서 부팅할 때 @Service를 모두 메모리에 올립니다.
	//톰켓이 메모리에 올릴 때, 생성자에 선언한 Komoran도 같이 메모리에 올라가도록 생성자에 코딩합니다.
	//생성자에서 Komoran을 메모리에 올리면, 매번 메모리에 올려서 호출하는 것이 아니라, 
	// 메모리에 올리간 객체만 불러와서 사용할 수 있기 때문에 처리 속도가 빠릅니다.
	public WordAnalysisServiceImpl() {
		
		log.info(this.getClass().getName() + ".WordAnalysisService creator Start !");
		
		//NLP 분석 객체 메모리 로딩합니다.
		this.nlp = new Komoran(DEFAULT_MODEL.FULL); // 학습데이터 경량화 버전( 웹 서비스에 적합합니다. )
		this.nlp.setUserDic("D:\\java\\workspace\\EatStamp3\\src\\main\\webapp\\common\\user_dict.txt");
		//this.nlp = new Komoran(DEFAULT_MODEL.FULL); // 학습데이터 전체 버전(일괄처리 : 배치 서비스에 적합합니다.
	
		log.info("톰켓이 부팅되면서 스프링 프레임워크가 자동 실행되었고, 스프링 실행될 때 nlp 변수에 Komoran 객체를 생성하여 저장함.");
		
		log.info(this.getClass().getName() + ".WordAnalysisService creator End !");
	
	
	}

	@Override
	public List<String> doWordNouns(String text) throws Exception {
		//log.info(this.getClass().getName() + ".doWordAnalysis Start !");
		
		//log.info("분석할 문장 : " + text);
		
		//분석할 문장에 대해 정제(쓸데없는 특수문자 제거)
		String replace_text = text.replace("[^가-힣a-zA-Z0-9", " ");
		
		//log.info("한국어, 영어, 숫자 제외 단어 모두 한 칸으로 변환시킨 문장 : " + replace_text);
		
		//분석할 문장의 앞, 뒤에 존재할 수 있는 필요없는 공백 제거
		String trim_text = replace_text.trim();
		
		//log.info("분석할 문장 앞, 뒤에 존재할 수 있는 필요 없는 공백 제거 : " + trim_text);
		
		//형태소 분석 시작
		KomoranResult analyzeResultList = this.nlp.analyze(trim_text);
		
		//형태소 분석 결과 중 명사만 가져오기
		List<String> rList = analyzeResultList.getNouns();
		
		if (rList == null) {
			rList = new ArrayList<String>();
		}
		
		// 두 글자 이상인 명사만 추출
	    List<String> filteredList = new ArrayList<>();
	    for (String word : rList) {
	        if (word.length() >= 2) {
	            filteredList.add(word);
	        }
	    }
		
		//분석 결과 확인을 위한 로그 찍기
		Iterator<String> it = filteredList.iterator();
		
		while (it.hasNext()) {
			//추출된 명사
			String word = WordVO.nvl(it.next());
			
			//log.info("word : " + word);
			//System.out.println("word : " + word);
		}
		
		
		//log.info(this.getClass().getName() + ".doWordAnalysis End !");
		
		return filteredList;
	}

	@Override
	public Map<String, Integer> doWordCount(List<String> pList) throws Exception {
		//log.info(this.getClass().getName() + ".doWordCount Start !");
		
		if (pList ==null) {
			pList = new ArrayList<String>();
		}
		
		//단어 빈도수(사과, 3) 결과를 저장하기 위해 Map객체 생성합니다.
		Map<String, Integer> rMap = new HashMap<>();
		
		//List에 존재하는 중복되는 단어들의 중복제거를 위해 set 데이터타입에 데이터를 저장합니다.
		//rSet 변수는 중복된 데이터가 저장되지 않기 떄문에 중복되지 않은 단어만 저장하고 나머지는 자동 삭제합니다.
		Set<String> rSet = new HashSet<String>(pList);
		
		//중복이 제거된 단어 모음에 빈도수를 구하기 위해 반복문을 사용합니다.
		Iterator<String> it = rSet.iterator();
		
		while(it.hasNext()) {
			//중복 제거된 단어
			String word = WordVO.nvl(it.next());
			
			//단어가 중복 저장되어 있는 pList로부터 단어의 빈도수 가져오기
			int frequency = Collections.frequency(pList, word);
			
			//log.info("word :" + word);
			//log.info("frequency : " + frequency);
			
			rMap.put(word, frequency);
		}
		
		//log.info(this.getClass().getName() + ".doWordCount End !");
		
		return rMap;
	}

	@Override
	public Map<String, Integer> doWordAnalysis(String text) throws Exception {
		//문장의 명사를 추출하기 위한 형태소 분석 실행
		List<String> filteredList = this.doWordNouns(text);
		
		if(filteredList == null) {
			filteredList = new ArrayList<String>();
		}
		
		//추출된 명사 모음(리스트)의 명사 단어별 빈도수 계산
		Map<String, Integer> rMap = this.doWordCount(filteredList);
		
		if(rMap == null) {
			rMap = new HashMap<String, Integer>();
		}
		
		return rMap;
	}

	@Override
	public Map<String, Integer> selectText(Map<String, Object> map) throws Exception {
		
		List<StampVO> stampList = keywordMapper.selectText(map); //내가 쓴 글의 content만 추출해서 분석할 문장에 삽입
		Map<String, Integer> rMap = new HashMap<String, Integer>()	; //분석된 결과
		List<Map<String, Integer>> rList = new ArrayList<Map<String, Integer>>(); //분석된 결과값 여러 개를 List로 통합
		
		if(stampList.size() > 0) { //분석할 문장이 있으면
			for(StampVO vo : stampList) {
				String content = vo.getS_content();
				rMap = doWordAnalysis(content); //분석 실행
				if (rMap.size()>0) { //분석할 문장에 명사가 있으면 (= 분석할 문장 사이즈가 0보다 크면) rList에 추가
					rList.add(rMap);
				}
				//System.out.println("rMap1: " + rMap);
			}

	        for (Map<String, Integer> map2 : rList) {
	            for (Map.Entry<String, Integer> entry : map2.entrySet()) {
	                String key = entry.getKey();
	                Integer value = entry.getValue();

	                //rMap에 Key가 이미 존재한다면 (map.containKey() 메소드 = 특정 key가 Map에 존재하는지 체크)
	                if (rMap.containsKey(key)) { 
	                    rMap.put(key, rMap.get(key) + value); //key에 value값 추가?
	                } else { //rMap에 존재하지 않는 key라면
	                    rMap.put(key, value); //key와 value값 같이 추가
	                }
	            }
	        }
	        System.out.println("키워드=빈도: " + rMap);
	        
	        // 내림차순 정렬
	        List<Map.Entry<String, Integer>> sortedList = new ArrayList<>(rMap.entrySet());
	        sortedList.sort(Map.Entry.<String, Integer>comparingByValue().reversed());

	        // 상위 8개 출력
	        int count = 0;
	        Map<String, Integer> result = new LinkedHashMap<>();
	        for (Map.Entry<String, Integer> entry : sortedList) {
	            result.put(entry.getKey(), entry.getValue());
	            count++;
	            if (count == 8) {
	                break;
	            }
	        }
	        System.out.println("빈도 높은 순으로 8 개 추출: " + result);
	        return result;
			}
		  return rMap;
	}
}
