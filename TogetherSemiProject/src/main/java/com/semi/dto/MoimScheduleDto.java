package com.semi.dto;

import java.sql.Time;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MoimScheduleDto")
public class MoimScheduleDto {

	private int msnum;
	private String mssubject;
	private String msdate;
	private String mstime;
	private String mslocation;
	private String mscost;
	private int mnum;
}