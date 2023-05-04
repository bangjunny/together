package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;

public interface CityServiceInter {
	public int getTotalCountCity();
	public List<CityBoardDto> getAllCity();
	public CityBoardDto getDetailbycbnum(int cbnum);
	public UserDto getDetailbyunum(int unum);
	public void insertCity(CityBoardDto dto);
	public String preContent(int num);
	public String nxtContent(int num);
	
	/**
	public void updateCity(CityBoardDto dto);
	public void deleteCity(int cbnum);
	**/
}
