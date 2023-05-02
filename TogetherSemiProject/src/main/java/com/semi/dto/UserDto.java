package com.semi.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("UserDto")
public class UserDto {

	private int unum;
	private String uname;
	private int age;
	private String gender;
	private String email;
	private String pass;
	private String hp;
	private String city1;
	private String city2;
	private Timestamp joinday;
	private int jjim;
	private String uphoto;
	private int mnum;
	
	
}
