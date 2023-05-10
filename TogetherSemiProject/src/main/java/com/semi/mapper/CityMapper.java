package com.semi.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;

@Mapper
public interface CityMapper {
	public int getTotalCountCity();
	public List<CityBoardDto> getCityList(String city1, String city2);

	public CityBoardDto getDetailbycbnum(int cbnum);
	public UserDto getDetailbyunum(int unum);
	public void insertCity(CityBoardDto dto);
	public String preContent(CityBoardDto dto);
	public String nxtContent(CityBoardDto dto);
	public String preNum(CityBoardDto dto);
	public String nxtNum(CityBoardDto dto);
	public void newComment(CbReBoardDto dto);
	public String getTotalComment(int cbnum);
	public List<CbReBoardDto> getCommentByCbnum(int cbnum);
	public void updateStep(Map<String,Integer> map);
	public int getReboardNum();
	public void addComment(CbReBoardDto dto);
	public CbReBoardDto getCommentByRenum(int renum);
	public void deleteCityboard(int cbnum);
	public List<CityBoardDto> getPagingList(Map<String, Integer> map);
	/**
	public void insertCity(CityBoardDto dto);
	public void updateCity(CityBoardDto dto);	
	**/
	}
	

