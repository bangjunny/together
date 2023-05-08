package com.semi.service;

import java.util.List;

import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;

public interface LoginServiceInter {
	
	public void insertUser(UserDto dto);

	public int isEqualPassEmail(String email, String pass); 
	public UserDto selectOneOfEmail(String email);

	public UserPhotoDto getUserPhoto(int photo_idx);

	public void insertUserPhoto(UserPhotoDto dto);

	public void deleteUserPhoto(int photo_idx);

	public List<UserPhotoDto> getUserPhotoList(int unum);
	
	public UserDto getUserInfo(int unum);
	 


}
