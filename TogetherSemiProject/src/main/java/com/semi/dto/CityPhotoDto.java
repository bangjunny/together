package com.semi.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CityPhotoDto")
public class CityPhotoDto {

	private int photonum;
	private int cbnum;
	private String photo_idx;
}
