package com.ddb.springmvc.service;

import java.util.Map;

import com.ddb.springmvc.domain.Product;

public interface ProductService {
	Product add(Product product);
	Product get(long id);
	Map<Long, Product> getAll();
	Map<Long, Product> del(long id);
}
