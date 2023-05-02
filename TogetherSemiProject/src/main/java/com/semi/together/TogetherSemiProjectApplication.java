package com.semi.together;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.semi.*","naver.cloud"})
@MapperScan({"com.semi.mapper"})
public class TogetherSemiProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TogetherSemiProjectApplication.class, args);
	}

}

