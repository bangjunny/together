package com.semi.service;

import java.util.List;

import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;

public interface LoginServiceInter {
	
	public void insertUser(UserDto dto);

	public int isEqualPassEmail(String email, String pass); 
	public UserDto selectOneOfEmail(String email);
	public int overlappedEmail(UserDto dto);


}
