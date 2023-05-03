package com.semi.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CityBoardDto")
public class CityBoardDto {

	private int cbnum;
	private String subject;
	private int unum;
	private String cbcontent;
	private String cbphoto;
	private int readcount;
	private int cbwriteday; //Timestamp 가 들어가야 하는데 지금 데이터가 없어서 임시로 int로 바꿈
	private String city1;
	private String city2;
	private int cblike;	
	
	
	
}
