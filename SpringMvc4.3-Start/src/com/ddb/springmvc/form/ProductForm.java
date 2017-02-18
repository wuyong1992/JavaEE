package com.ddb.springmvc.form;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductForm {
	private Long id;
	private String name;
	private String description;
	private String price;
	private String count;

}
