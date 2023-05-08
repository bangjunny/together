package com.semi.mapper;


import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;

@Mapper
public interface LoginMapper {
	
	public void insertUser(UserDto dto);
	public int isEqualPassEmail(Map<String, String> map); // map : email, pass
	public UserDto selectOneOfEmail(String email);
	 

	/*마이페이지*/
	public UserDto getMypage(int unum);

	public int getTotalCount();

	public List<UserDto> getAllUsers();
	
	public void updatePhoto(Map<String, Object> map);
	
	public void updateMypage(UserDto dto);
	public void insertUserPhoto(UserPhotoDto dto);
	public UserPhotoDto getUserPhoto(int photo_idx);
	public List<UserPhotoDto> getUserPhotoList(int unum);
	public void deleteUserPhoto(int photo_idx);
	public UserDto getUserInfo(int unum);
	
}
