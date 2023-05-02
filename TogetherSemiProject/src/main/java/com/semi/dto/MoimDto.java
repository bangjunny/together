package com.semi.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MoimDto")
public class MoimDto {

	private int mnum;
	private String mname;
	private String jang;
	private int unum;
	private String mphoto;
	private String city1;
	private String city2;
	private String category;
	private String mcontent;
	private Timestamp createday;
	private String jjim;
	private String open;
	
}
