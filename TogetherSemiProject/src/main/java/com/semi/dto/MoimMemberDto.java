package com.semi.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MoimMemberDto")
public class MoimMemberDto {	
	private int mmnum;
	private int unum;
	private String mname;
	private int acceptcall;
}
