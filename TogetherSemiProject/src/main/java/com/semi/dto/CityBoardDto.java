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
	private Timestamp cbwriteday;
	private String city1;
	private String city2;
	private int cblike;	
	
	
	
}
