package com.semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dto.CityBoardDto;
import com.semi.mapper.CityMapper;

@Service
public class CityService implements CityServiceInter{
	
	@Autowired
	private CityMapper cityMapper;

	@Override
	public int getTotalCountCity() {
		// TODO Auto-generated method stub
		return cityMapper.getTotalCountCity();
	}

	@Override
	public List<CityBoardDto> getAllCity() {
		// TODO Auto-generated method stub
		return cityMapper.getAllCity();
	}




}
