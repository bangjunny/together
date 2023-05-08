package com.semi.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("UserPhotoDto")
public class UserPhotoDto {
	private int photo_idx;
	private int unum;
	private String file_name;
}
