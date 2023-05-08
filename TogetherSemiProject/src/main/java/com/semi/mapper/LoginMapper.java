package com.semi.mapper;


import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.MoimDto;
import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;

@Mapper
public interface LoginMapper {
	
	public void insertUser(UserDto dto);
	public int isEqualPassEmail(Map<String, String> map); // map : email, pass
	public UserDto selectOneOfEmail(String email);
	public int overlappedEmail(UserDto dto);

	/*마이페이지*/
	public UserDto getMypage(int unum);

	public int getTotalCount();

	public List<UserDto> getAllUsers();
	
	public void updatePhoto(Map<String, Object> map);
	
	public void updateMypage(UserDto dto);
	
	
}
