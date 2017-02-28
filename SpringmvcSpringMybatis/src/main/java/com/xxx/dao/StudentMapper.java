package com.xxx.dao;


import java.util.List;

import com.xxx.model.Student;

/**
 * 动态代理Dao
 * @author Administrator
 *
 */
public interface StudentMapper {

	//增
	public void addStudent(Student student) ;
	//查找所有
	public List<Student> selectAllStudent() ;
	//根据id删除
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
