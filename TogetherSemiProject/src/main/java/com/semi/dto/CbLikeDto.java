package com.semi.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("CbLikeDto")
public class CbLikeDto {

	private int cblikenum;
	private int unum;
	private int cbnum;

	
	@Override
	public String toString() {
		return "CbLikeDto [cblikenum=" + cblikenum + ", unum=" + unum + ", cbnum=" + cbnum + "]";
	}

}