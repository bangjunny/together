package com.semi.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.UserDto;

@Mapper
public interface LoginMapper {
	
	public void insertUser(UserDto dto);

}
