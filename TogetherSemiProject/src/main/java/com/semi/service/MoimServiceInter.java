package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.MoimDto;
import com.semi.dto.MoimMemberDto;
import com.semi.dto.MoimScheduleDto;
import com.semi.dto.ScheduleJoinDto;

public interface MoimServiceInter {
	public int getMaxNum();
	public int getTotalCount(String category,String city1, String city2);
	public void insertMoim(MoimDto dto);
	public void insertMoimMember(MoimMemberDto mdto);
	public List<MoimDto> getPagingList(int start, int perpage, String category, String city1, String city2, String sort);//map:start,perpage	
	public void updateJjimcount(int mnum, int unum);
	public MoimDto getData(int mnum);
	public void deleteMoim(int mnum);
	public boolean pressJjim(int unum, int mnum);
	public void deleteJjim(int unum, int mnum);
	public void moimGaip(int unum, String mname);
	public void deleteGaip(int unum, String mname);
	public boolean pressGaip(int unum, String mname);
	public void updateMoim(MoimDto dto);
	public int overlappedMname(MoimDto dto);
	public List<Map<String, Object>> getGaipmemberList(String mname);
	public void acceptGaip(int unum, String mname);
	public void deniedGaip(int unum, String mname);
	public Integer acceptChk(int unum, String mname);
	public void insertMoimSchedule(MoimScheduleDto msdto);
	public int getScheduleCount(int mnum);
	public void changeMm(String hiddenname,String Mmname);
	public List<MoimScheduleDto> getScheduleList(int mnum, int unum);
	public void deleteSchedule(String mssubject, int mnum);
	public void insertSchedulemaker(ScheduleJoinDto sjdto);
	public void scheduleJoin(int unum, int msnum, int mnum);
	public void cancelScheduleJoin(int unum, int msnum);
	public int getMemberCheckCount(int unum,String mname);
}	