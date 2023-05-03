package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.CityBoardDto;

public interface CityServiceInter {
	public int getTotalCountCity();
	public List<CityBoardDto> getAllCity();
	public List<CityBoardDto> getPaginlistCity(int start, int perpage);
	public void insertCity(CityBoardDto dto);
	public void updateCity(CityBoardDto dto);
	public void deleteCity(int cbnum);
}
