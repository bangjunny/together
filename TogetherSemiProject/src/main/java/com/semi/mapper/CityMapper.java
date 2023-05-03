package com.semi.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.semi.dto.CityBoardDto;

@Mapper
public interface CityMapper {
	public int getTotalCountCity();
	public List<CityBoardDto> getAllCity();
	//public List<CityBoardDto> getPaginlistCity(Map<String, Integer> map);
	/**
	public void insertCity(CityBoardDto dto);
	public void updateCity(CityBoardDto dto);
	public void deleteCity(int cbnum);
	**/
	}
	

