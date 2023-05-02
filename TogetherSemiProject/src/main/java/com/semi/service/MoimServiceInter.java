package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.MoimDto;

public interface MoimServiceInter {
	public int getMaxNum();
	public int getTotalCount();
	public void insertMoim(MoimDto dto);
	public List<MoimDto> getPagingList(int start, int perpage);//map:start,perpage
	public void updateJjimcount(int mnum);
	public MoimDto getData(int mnum);
	public void deleteMoim(int mnum);
	public void updateMoim(MoimDto dto);
}
