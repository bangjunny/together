package com.semi.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("UserPhotoDto")
public class UserPhotoDto {

	private int photo_idx;
	private int unum;
	private String file_name;
	private int is_main;
	
	@Override
	public String toString() {
		return "UserPhotoDto [photo_idx=" + photo_idx + ", unum=" + unum + ", file_name=" + file_name + ", is_main=" + is_main + "]";
	}
	
	
}