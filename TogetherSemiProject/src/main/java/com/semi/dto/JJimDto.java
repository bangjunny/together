package com.semi.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("JJimDto")
public class JJimDto {

	private int jnum;
	private int unum;
	private int mnum;

	
	@Override
	public String toString() {
		return "JJimDto [jnum=" + jnum + ", unum=" + unum + ", mnum=" + mnum + "]";
	}
	
	
}