package com.semi.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ScheduleJoinDto")
public class ScheduleJoinDto {	
	private int sjnum;
	private int unum;
	private String mssubject;
	private int mnum;
}