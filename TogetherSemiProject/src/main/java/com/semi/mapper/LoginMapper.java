package com.semi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;

@Mapper
public interface LoginMapper {
	
	public void insertUser(UserDto dto);

	/*마이페이지*/
	public UserDto getMypage(int unum);

	public int getTotalCount();

	public List<UserDto> getAllUsers();
	
	
}
