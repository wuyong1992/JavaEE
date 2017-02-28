package com.xxx.model;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class Student {

	private Integer id;
	private String name;
	private Integer age;
	private String sex;
	
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", sex=" + sex + "]";
	}
}
