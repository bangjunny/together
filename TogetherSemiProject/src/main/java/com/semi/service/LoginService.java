package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
	}


	
}
