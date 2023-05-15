package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.MoimDto;

public interface MoimServiceInter {
	public int getMaxNum();
	public int getTotalCount(String category,String city1, String city2);
	public void insertMoim(MoimDto dto);
	public List<MoimDto> getPagingList(int start, int perpage, String category, String city1, String city2, String sort);//map:start,perpage	
	public void updateJjimcount(int mnum, int unum);
	public MoimDto getData(int mnum);
	public void deleteMoim(int mnum);
	public boolean pressJjim(int unum, int mnum);
	public void deleteJjim(int unum, int mnum);
	public void moimGaip(int unum, int mnum);
	public void deleteGaip(int unum, int mnum);
	public boolean pressGaip(int unum, int mnum);
	public void updateMoim(MoimDto dto);
	public int overlappedMname(MoimDto dto);
	public List<Map<String, Object>> getGaipmemberList(int mnum);
	public void acceptGaip(int unum, int mnum);
	public void deniedGaip(int unum, int mnum);
	public Integer acceptChk(int unum, int mnum);
	
}	