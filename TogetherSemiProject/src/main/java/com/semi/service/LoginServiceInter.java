package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;

public interface LoginServiceInter {
	
	public void insertUser(UserDto dto);
	
	public void updateMyPhoto(UserPhotoDto pdto);
	
	public int isEqualPassEmail(String email, String pass); 
	public UserDto selectOneOfEmail(String email);
	public int overlappedEmail(UserDto dto);
	public List<UserDto> getAllUsers();
	public UserDto getUserByUnum(int unum);

	List<Map<String, Object>> getJJimMoimList(int unum);
	public List<Map<String, Object>> getGaipMoimList(int unum);

	public String getSelectPhoto(int photo_idx);

	public void deletePhoto(int photo_idx);

	public boolean mypagePassCheck(int unum, String pass);

	public void updateMypage(UserDto dto);
	

	
}