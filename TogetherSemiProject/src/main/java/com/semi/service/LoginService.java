package com.semi.service;


import java.util.List;
import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;
import com.semi.mapper.LoginMapper;

@Service
public class LoginService implements LoginServiceInter{

	@Autowired
	LoginMapper loginMapper;

	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		loginMapper.insertUser(dto);
	}

	@Override
	public int isEqualPassEmail(String email, String pass) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<>();
		map.put("email",email);
		map.put("pass", pass);
		
		return loginMapper.isEqualPassEmail(map);
	}


	@Override
	public UserDto selectOneOfEmail(String email) {
		// TODO Auto-generated method stub
		return loginMapper.selectOneOfEmail(email);
	}

	public UserPhotoDto uploadPhoto(MultipartFile file, int unum) {
		// TODO Auto-generated method stub
		return null;
	}

	public byte[] getPhotoById(int photo_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<UserPhotoDto> getPhotoListByUserId(int photo_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	public UserDto getUserInfo(int unum) {
		// TODO Auto-generated method stub
		return loginMapper.getUserInfo(unum);
	}
	
	
    @Override
    public UserPhotoDto getUserPhoto(int photo_idx) {
        return loginMapper.getUserPhoto(photo_idx);
    }

    @Override
    public void insertUserPhoto(UserPhotoDto dto) {
    	loginMapper.insertUserPhoto(dto);
    }

    @Override
    public void deleteUserPhoto(int photo_idx) {
    	loginMapper.deleteUserPhoto(photo_idx);
    }

	@Override
	public List<UserPhotoDto> getUserPhotoList(int unum) {
		// TODO Auto-generated method stub
		  return loginMapper.getUserPhotoList(unum);
	}
	
	
}
