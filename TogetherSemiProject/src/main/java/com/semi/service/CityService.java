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

	/*
	 * @Override public List<CityBoardDto> getAllCity() { // TODO Auto-generated
	 * method stub return cityMapper.getAllCity(); }
	 * 
	 * @Override public void insertCity(CityBoardDto dto) { // TODO Auto-generated
	 * method stub cityMapper.insertCity(dto);
	 * 
	 * }
	 * 
	 * @Override public void updateCity(CityBoardDto dto) { // TODO Auto-generated
	 * method stub cityMapper.updateCity(dto); }
	 * 
	 * @Override public void deleteCity(int cbnum) { // TODO Auto-generated method
	 * stub cityMapper.deleteCity(cbnum);
	 * 
	 * }
	 * 
	 * @Override public List<CityBoardDto> getPaginlistCity(int start, int perpage)
	 * { // TODO Auto-generated method stub Map<String, Integer> map=new
	 * HashMap<>(); map.put("start", start); map.put("perpage",perpage); return
	 * cityMapper.getPaginlistCity(map); }
	 */
}
