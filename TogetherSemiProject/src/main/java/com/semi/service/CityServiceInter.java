package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.CityPhotoDto;
import com.semi.dto.UserDto;



public interface CityServiceInter {
	public int getTotalCountCity(String city1, String city2, String keyword);//특정지역갯수
	public List<CityBoardDto> getCityPagingList(int start, int perpage, String city1, String city2, String keyword);//특정지역리스트
	public List<CityBoardDto> getCityPagingListReadTop(String city1, String city2, String keyword);//조회수top3
	public List<CityBoardDto> getCityPagingListLikeTop(String city1, String city2, String keyword);//추천수top3
	
	public CityBoardDto getDetailbycbnum(int cbnum);
	public UserDto getDetailbyunum(int unum);
	public void insertCity(CityBoardDto dto);
	public String preContent(CityBoardDto dto);
	public String nxtContent(CityBoardDto dto);
	public String preNum(CityBoardDto dto);
	public String nxtNum(CityBoardDto dto);
	public void newComment(CbReBoardDto dto);
	public String getTotalComment(int cbnum);
	public List<CbReBoardDto> getCommentByCbnum(int cbnum);
	public void updateStep(int ref, int step);
	public int getReboardNum();

	public void addComment(CbReBoardDto dto);
	public CbReBoardDto getCommentByRenum(int renum);
	public void deleteCityboard(int cbnum);
	public void updateComment(CbReBoardDto dto);
	public void deleteComment(int renum);
	public void updateReadcount(int cbnum);
	public void newCityPhoto(CityPhotoDto dto);
	public List<String> getAllPhoto(int cbnum);
	public List<CityPhotoDto> getPhoto (int cbnum);
	public String getPhotoCount(int cbnum);
	public void updateCity(CityBoardDto dto);
	public void updateCityPhoto(CityBoardDto dto);
	public void deleteCityPhoto(String photo_idx);
	public void cblike(int unum, int cbnum);
	public void cbdislike(int unum, int cbnum);
	public int cblikecheck(int unum, int cbnum);
	public int cblikecountplus(int cbnum);
	public int cblikecountminus(int cbnum);
	public String getMainPhoto(int unum);

	/**
	public void updateCity(CityBoardDto dto);
	**/
}
