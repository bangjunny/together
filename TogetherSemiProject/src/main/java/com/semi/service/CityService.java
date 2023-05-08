package com.semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;
import com.semi.mapper.CityMapper;

@Service
public class CityService implements CityServiceInter{
	
	@Autowired
	private CityMapper cityMapper;

	@Override
	public int getTotalCountCity(String city1, String city2) {
		// TODO Auto-generated method stub
		return cityMapper.getTotalCountCity(city1, city2);
	}


	@Override
	public CityBoardDto getDetailbycbnum(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getDetailbycbnum(cbnum);
	}

	@Override
	public UserDto getDetailbyunum(int unum) {
		// TODO Auto-generated method stub
		return cityMapper.getDetailbyunum(unum);
	}

	@Override
	public void insertCity(CityBoardDto dto) {
		// TODO Auto-generated method stub
		cityMapper.insertCity(dto);
	}

	@Override
	public List<CityBoardDto> getCityList(String city1, String city2) {
		// TODO Auto-generated method stub
		return cityMapper.getCityList(city1, city2);
	}
	
	@Override
	public String preContent(CityBoardDto dto) {
		// TODO Auto-generated method stub
		return cityMapper.preContent(dto);
	}

	@Override
	public String nxtContent(CityBoardDto dto) {
		// TODO Auto-generated method stub
    
		return cityMapper.nxtContent(dto);

	}

	@Override
	public String preNum(CityBoardDto dto) {
		// TODO Auto-generated method stub
		return cityMapper.preNum(dto);
	}

	@Override
	public String nxtNum(CityBoardDto dto) {
		// TODO Auto-generated method stub
		return cityMapper.nxtNum(dto);
	}

	@Override
	public int getTotalComment() {
		// TODO Auto-generated method stub
		return cityMapper.getTotalComment();
	}

	@Override
	public List<CbReBoardDto> getComment(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getComment(cbnum);
	}

	@Override
	public void updateStep(int ref, int step) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("ref", ref);
		map.put("step",step);
		
		cityMapper.updateStep(map);
	}

	@Override
	public void newComment(CbReBoardDto dto) {
		// TODO Auto-generated method stub
		int ref=dto.getRef();
		int step=dto.getStep();
		int depth=dto.getDepth();
		
		if(dto.getRenum()==0) {
			step=0;
			depth=0;
			ref=cityMapper.getReboardNum()+1;
		}
		else {
			this.updateStep(ref, step);
			step++;
			depth++;
		}
		
		dto.setRef(ref);
		dto.setStep(step);
		dto.setDepth(depth);
		
		cityMapper.newComment(dto);
	}

	@Override
	public int getReboardNum() {
		// TODO Auto-generated method stub
		return cityMapper.getReboardNum();
	}


}
