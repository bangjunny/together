package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;

public interface CityServiceInter {
	public int getTotalCountCity(String city1, String city2);
	public CityBoardDto getDetailbycbnum(int cbnum);
	public UserDto getDetailbyunum(int unum);
	public void insertCity(CityBoardDto dto);
	public String preContent(CityBoardDto dto);
	public String nxtContent(CityBoardDto dto);
	public String preNum(CityBoardDto dto);
	public String nxtNum(CityBoardDto dto);
	public void newComment(CbReBoardDto dto);
	public int getTotalComment();
	public List<CbReBoardDto> getComment(int cbnum);
	public void updateStep(int ref, int step);
	public int getReboardNum();
	public List<CityBoardDto> getCityList(String city1, String city2);
	public void deleteCityboard(int cbnum);

	/**
	public void updateCity(CityBoardDto dto);
	**/
}
