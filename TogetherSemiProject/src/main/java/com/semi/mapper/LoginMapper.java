package com.semi.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.UserDto;

@Mapper
public interface LoginMapper {
	
	public void insertUser(UserDto dto);
	public int isEqualPassEmail(Map<String, String> map); // map : email, pass
	public UserDto selectOneOfEmail(String email);
	 

}
