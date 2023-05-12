package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.MoimDto;

public interface MoimServiceInter {
	public int getMaxNum();
	public int getTotalCount();
	public int getCategoryCount(String category);
	public void insertMoim(MoimDto dto);
	public List<MoimDto> getPagingList(int start, int perpage);//map:start,perpage
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
	public List<MoimDto> getCategoryPagingList(int start, int perpage, String category);
	public List<Map<String, Object>> getGaipmemberList(int mnum);
	public void acceptGaip(int unum, int mnum);
	public void deniedGaip(int unum, int mnum);
	public Integer acceptChk(int unum, int mnum);
	
}	
