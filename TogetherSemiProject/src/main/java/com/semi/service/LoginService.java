package com.semi.service;


import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dto.CityBoardDto;
import com.semi.dto.JJimDto;
import com.semi.dto.MoimDto;
import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;
import com.semi.mapper.CityMapper;
import com.semi.mapper.LoginMapper;
import com.semi.mapper.MoimMapper;

@Service
public class LoginService implements LoginServiceInter{

	@Autowired
	LoginMapper loginMapper;
	@Autowired
	MoimMapper moimMapper;
	@Autowired
	CityMapper cityMapper;

	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		loginMapper.insertUser(dto);
	}

	@Override
	public void insertSo(UserDto dto) {
		// TODO Auto-generated method stub
		loginMapper.insertSo(dto);
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

	@Override
	public int overlappedEmail(UserDto dto) {
		// TODO Auto-generated method stub
		return loginMapper.overlappedEmail(dto);
	}

	@Override
	public List<UserDto> getAllUsers() {
		// TODO Auto-generated method stub
		return loginMapper.getAllUsers();
	}

	@Override
	public UserDto getUserByUnum(int unum) {
		// TODO Auto-generated method stub
		return loginMapper.getUserByUnum(unum);
	}
  

	@Override
	public List<Map<String, Object>> getJJimMoimList(int unum) {
		// 사용자가 찜한 목록을 조회한다.
	    List<JJimDto> likeList = loginMapper.getJJimDto(unum);
	    //찜한 모임 정보를 담을 그릇을 만든다. 
	    
	    List<Map<String, Object>> jjimList = new ArrayList<Map<String, Object>>();
	    if (Objects.isNull(likeList)) {
	        return null;
	    }
	 // 찜한 목록을 하나씩 조회한다.
	    likeList.forEach(i -> {
	        // 해당 사용자가 찜한 모임의 번호로 모임 정보를 조회한다.
	        MoimDto moimDto = moimMapper.getData(i.getMnum());
	        // 모임 정보를 Map에 담는다.
	        Map<String, Object> moimMap = new HashMap<String, Object>();
	        moimMap.put("mnum", moimDto.getMnum());
	        moimMap.put("mname", moimDto.getMname());
	        moimMap.put("mcontent", moimDto.getMcontent());
	        moimMap.put("mphoto",moimDto.getMphoto());
	        // 모임 정보를 그릇에 담는다.
	        jjimList.add(moimMap);
	    });
	    // 찜한 모임 목록을 반환한다.
	    return jjimList;
	}
	/*
	 * @Override public List<Map<String, Object>> getcbLikeList(int unum) { // 사용자가
	 * 찜한 목록을 조회한다. List<CbLikeDto> cbdlist = loginMapper.getCbLikeDto(unum); //찜한
	 * 모임 정보를 담을 그릇을 만든다.
	 * 
	 * List<Map<String, Object>> cbLikeList = new ArrayList<Map<String, Object>>();
	 * if (Objects.isNull(cbdlist)) { return null; } // 찜한 목록을 하나씩 조회한다.
	 * cbdlist.forEach(i -> { // 해당 사용자가 찜한 모임의 번호로 모임 정보를 조회한다. CityBoardDto cbDto
	 * = cityMapper.getDetailbycbnum(i.getCbnum()); // 모임 정보를 Map에 담는다. Map<String,
	 * Object> cbMap = new HashMap<String, Object>(); cbMap.put("cbnum",
	 * cbDto.getCbnum()); cbMap.put("subject", cbDto.getSubject());
	 * cbMap.put("cbcontent", cbDto.getCbcontent()); cbMap.put("readcount",
	 * cbDto.getReadcount()); cbMap.put("city1", cbDto.getCity1());
	 * cbMap.put("city2", cbDto.getCity2());
	 * 
	 * // 모임 정보를 그릇에 담는다. cbLikeList.add(cbMap); }); // 찜한 모임 목록을 반환한다. return
	 * cbLikeList; }
	 */
	
	

	@Override
	public List<Map<String, Object>> getGaipMoimList(int unum) {
		
		return loginMapper.getGaipMoimList(unum);
	}

	@Override
	public String getSelectPhoto(int photo_idx) {
		// TODO Auto-generated method stub
		return loginMapper.getSelectPhoto(photo_idx);
	}
	@Override
	public void deletePhoto(int photo_idx) {
		// TODO Auto-generated method stub
		loginMapper.deletePhoto(photo_idx);
	}
	@Override
	public boolean mypagePassCheck(int unum, String pass) {
		Map<String, Object> map=new HashMap<>();
		map.put("unum", unum);
		map.put("pass", pass);
		//비번이 맞으면 1->true반환, 틀리면 0->false반환
		boolean pck=loginMapper.mypagePassCheck(map)==0?false:true;
		return pck;
	}
	@Override
	public void updateMypage(UserDto dto) {
		// TODO Auto-generated method stub
		loginMapper.updateMypage(dto);
	}

	@Override
	public List<CityBoardDto> getMyCBList(int start, int perpage, int unum) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
	      map.put("start", start);
	      map.put("perpage", perpage);
	      map.put("unum", unum);	     
	      return loginMapper.getMyCBList(map);
	}

	@Override
	public int getMyCBWRCount(int unum) {
		// TODO Auto-generated method stub
		return loginMapper.getMyCBWRCount(unum);
	}

	@Override
	public List<CityBoardDto> getCbLikeList(int start, int perpage, int unum) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
	      map.put("start", start);
	      map.put("perpage", perpage);
	      map.put("unum", unum);	     
	      return loginMapper.getCbLikeList(map);
	}

	@Override
	public int getMyCBLikeCount(int unum) {
		// TODO Auto-generated method stub
		return loginMapper.getMyCBLikeCount(unum);
	}


	

	
	
	


	
}