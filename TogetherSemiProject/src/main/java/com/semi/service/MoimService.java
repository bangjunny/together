package com.semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dto.MoimDto;
import com.semi.mapper.MoimMapper;

@Service
public class MoimService implements MoimServiceInter {
	
	@Autowired
	private MoimMapper moimMapper;
	
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return moimMapper.getMaxNum();
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return moimMapper.getTotalCount();
	}

	@Override
	public void insertMoim(MoimDto dto) {
		// TODO Auto-generated method stub
		moimMapper.insertMoim(dto);
	}

	@Override
	public List<MoimDto> getPagingList(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		return moimMapper.getPagingList(map);
	}

	@Override
	public void updateJjimcount(int mnum) {
		// TODO Auto-generated method stub
		moimMapper.updateJjimcount(mnum);
	}

	@Override
	public MoimDto getData(int mnum) {
		// TODO Auto-generated method stub
		return moimMapper.getData(mnum);
	}

	@Override
	public void deleteMoim(int mnum) {
		// TODO Auto-generated method stub
		moimMapper.deleteMoim(mnum);
	}

	@Override
	public void updateMoim(MoimDto dto) {
		// TODO Auto-generated method stub
		moimMapper.updateMoim(dto);
	}

}
