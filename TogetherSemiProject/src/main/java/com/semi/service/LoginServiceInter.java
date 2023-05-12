package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;

public interface LoginServiceInter {
	
	public void insertUser(UserDto dto);
	public int isEqualPassEmail(String email, String pass); 
	public UserDto selectOneOfEmail(String email);
	public int overlappedEmail(UserDto dto);
	public List<UserDto> getAllUsers();
	public UserDto getUserByUnum(int unum);
	public UserPhotoDto getMyPhoto(int photo_idx);
	List<Map<String, Object>> getJJimMoimList(int unum);

	public void updateMainphoto(int unum, int photo_idx);

}