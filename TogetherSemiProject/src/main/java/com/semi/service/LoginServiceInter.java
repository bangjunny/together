package com.semi.service;

import com.semi.dto.UserDto;

public interface LoginServiceInter {
	
	public void insertUser(UserDto dto);
	public int isEqualPassEmail(String email, String pass); 
	public UserDto selectOneOfEmail(String email);
	 

}
