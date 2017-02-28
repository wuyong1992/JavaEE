package com.xxx.service;


import java.util.List;

import com.xxx.model.Student;

public interface StudentService {

	//增
	public void add(Student student);
	//查找所有
	public List<Student> selectAllStudent();
	//根据id删
	public void deleteStudentById(Integer id);
	//根据id获取对象
	public Student selectStudentById(Integer id);
	//根据id修改对象
	public void updateStudentById(Student student);
	//模糊查询
	public List<Student> likeSelect(Student student);
	//批量删除
	//public void delectStudentsByIds(String[] ids);
}
