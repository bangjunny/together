package com.semi.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.JJimDto;
import com.semi.dto.MoimDto;
import com.semi.dto.MoimMemberDto;
import com.semi.dto.MoimScheduleDto;
import com.semi.dto.ScheduleJoinDto;

@Mapper
public interface MoimMapper {
	public int getMaxNum();
	public int getTotalCount(String category, String city1, String city2);
	public void insertMoim(MoimDto dto);
	public void insertMoimMember(MoimMemberDto mdto);
	public List<MoimDto> getPagingList(Map<String, Object> map);//map:start,perpage
	public void updateJjimcount(Map<String, Integer> map);//unum, mnum
	public MoimDto getData(int mnum);
	public void deleteMoim(int mnum);
	public void updateMoim(MoimDto dto);
	public int overlappedMname(MoimDto dto);
	public int pressJjim(Map<String, Object> map);//unum, mnum
	public void deleteJjim(Map<String, Object> map);
	public void moimGaip(Map<String, Object> map);
	public void deleteGaip(Map<String, Object> map);
	public int pressGaip(Map<String, Object> map);//unum, mnum
	public List<Map<String, Object>> getGaipmemberList(String mname);
	public void acceptGaip(Map<String, Object> map);
	public void deniedGaip(Map<String, Object> map);
	public Integer acceptChk(Map<String, Object> map);//unum, mnum
	public List<MoimDto> getJoinedMoimList(int unum);
	public List<JJimDto> getJJimList(int mnum);	
	public void insertMoimSchedule(MoimScheduleDto msdto);
	public int getScheduleCount(int mnum);
	public void changeMm(Map<String, Object> map);
	public List<MoimScheduleDto> getScheduleList(Map<String, Object> map);
	public void deleteSchedule(Map<String, Object> map);
	public void insertSchedulemaker(ScheduleJoinDto sjdto);
	public void scheduleJoin(Map<String, Object> map);
}