package com.semi.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;

@Mapper
public interface CityMapper {
	public int getTotalCountCity(String city1, String city2);//특정지역리스트갯수
	public List<CityBoardDto> getCityPagingList(Map<String, Object>map);//특정지역리스트
	public int getAllTotalCountCity();//전체지역리스트갯수
	public List<CityBoardDto> getAllCityPagingList(Map<String, Integer>map);//전체지역리스트

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
	public void updateComment(CbReBoardDto dto);
	public void deleteComment(int renum);
	
	/**
	public void insertCity(CityBoardDto dto);
	public void updateCity(CityBoardDto dto);	
	**/
	}
	

