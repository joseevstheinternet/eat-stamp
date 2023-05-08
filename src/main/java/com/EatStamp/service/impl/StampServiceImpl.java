package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.CmtVO;
import com.EatStamp.domain.StampVO;
import com.EatStamp.mapper.StampMapper;
import com.EatStamp.service.StampService;

@Service
@Transactional
public class StampServiceImpl implements StampService {
	
	@Autowired
	private StampMapper stampMapper;

	@Override
	public List<StampVO> selectList(Map<String, Object> map) throws Exception {
		return stampMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) throws Exception {
		return stampMapper.selectRowCount(map);
	}

	@Override
	public void insertStamp(StampVO stamp) throws Exception {
		stampMapper.insertStamp(stamp);
	}

	@Override
	public StampVO selectStamp(Integer s_num) throws Exception {
		return stampMapper.selectStamp(s_num);
	}

	@Override
	public void updateStamp(StampVO stamp) throws Exception {
		stampMapper.updateStamp(stamp);
	}

	@Override
	public void deleteStamp(Integer s_num) throws Exception {
		stampMapper.deleteStamp(s_num);
	}

	@Override
	public int selectCmtCount(Integer s_num) throws Exception {
		return stampMapper.selectCmtCount(s_num);
	}

	@Override
	public List<StampVO> selectAllList(Map<String, Object> map) throws Exception {
		return stampMapper.selectAllList(map);
	}

	@Override
	public void updateViewCnt(Integer s_num) throws Exception {
		stampMapper.updateViewCnt(s_num);
	}

	@Override
	public void insertCmt(CmtVO cmt) throws Exception {
		stampMapper.insertCmt(cmt);
	}

	@Override
	public List<CmtVO> selectCmtAllList(Map<String, Object> map) throws Exception {
		return stampMapper.selectCmtAllList(map);
	}

	@Override
	public List<CmtVO> selectCmtList(Integer s_num) throws Exception {
		return stampMapper.selectCmtList(s_num);
	}
	
	@Override
	public CmtVO selectCmt(Integer cmt_num) throws Exception {
		return stampMapper.selectCmt(cmt_num);
	}

	@Override
	public void updateCmt(Integer cmt_num) throws Exception {
		stampMapper.updateCmt(cmt_num);
	}

	@Override
	public void deleteCmt(Integer cmt_num) throws Exception {
		stampMapper.deleteCmt(cmt_num);
	}

	@Override
	public void deleteCmtBySNum(Integer s_num) throws Exception {
		stampMapper.deleteCmtBySNum(s_num);
	}
}