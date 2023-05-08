package com.semi.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;

@Mapper
public interface CityMapper {
	public int getTotalCountCity(String city1, String city2);
	public List<CityBoardDto> getCityList(String city1, String city2);

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
	public void updateStep(Map<String,Integer> map);
	public int getReboardNum();
	public void deleteCity(int cbnum);
	public int isEqualPass(Map<String, Object> map);
	
	/**
	public void insertCity(CityBoardDto dto);
	public void updateCity(CityBoardDto dto);
	**/
	}
	

