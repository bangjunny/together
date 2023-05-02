package com.semi.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CbReBoardDto")
public class CbReBoardDto {
	
	private int renum;
	private int unum;
	private String uname;
	private String recontent;
	private Timestamp cbwriteday;
	private int ref;
	private int step;
	private int depth;
}
