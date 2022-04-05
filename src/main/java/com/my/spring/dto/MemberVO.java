package com.my.spring.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString


public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String address1;
	private String address2;
	private String address3;
	private String phone;
	private String useyn;
	private Timestamp regdate;
}
