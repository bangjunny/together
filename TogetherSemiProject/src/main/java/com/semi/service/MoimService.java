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
	public List<MoimDto> getAllMoim() {
		// TODO Auto-generated method stub
		return moimMapper.getAllMoim();
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
	public void updateJjimcount(int mnum, int unum) {
		// TODO Auto-generated method stub
		Map<String, Integer>map = new HashMap<>();
		map.put("mnum", mnum);
		map.put("unum", unum);
		
		moimMapper.updateJjimcount(map);
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

	@Override
	public int overlappedMname(MoimDto dto) {
		return moimMapper.overlappedMname(dto);
	}

	@Override
	public boolean pressJjim(int unum, int mnum) {
	
		Map<String, Object> map = new HashMap<>();
		map.put("mnum", mnum);
		map.put("unum", unum);
		
		boolean pressChk = moimMapper.pressJjim(map)==0?false:true;
		return pressChk;
	}

	@Override
	public void deleteJjim(int unum, int mnum) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("mnum", mnum);
		map.put("unum", unum);
		
		moimMapper.deleteJjim(map);
		
	}

	@Override
	public void moimGaip(int unum, int mnum) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("mnum", mnum);
		map.put("unum", unum);
		
		moimMapper.moimGaip(map);
		
	}

	@Override
	public void deleteGaip(int unum, int mnum) {
		Map<String, Object> map = new HashMap<>();
		map.put("mnum", mnum);
		map.put("unum", unum);
		
		moimMapper.deleteGaip(map);
		
	}

	@Override
	public boolean pressGaip(int unum, int mnum) {
		Map<String, Object> map = new HashMap<>();
		map.put("mnum", mnum);
		map.put("unum", unum);
		System.out.println(map);
		System.out.println("pressGaip service");
		
		boolean pressGaipChk = moimMapper.pressGaip(map)==0?false:true;
		return pressGaipChk;
	}






	
	
}
