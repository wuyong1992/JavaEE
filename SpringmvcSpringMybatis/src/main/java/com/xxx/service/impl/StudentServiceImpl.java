package com.xxx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.xxx.dao.StudentMapper;
import com.xxx.model.Student;
import com.xxx.service.StudentService;

@Service("studentServiceImpl")
public class StudentServiceImpl implements StudentService {

	@Autowired
	public StudentMapper studentMapper;
	
	@Override
	public void add(Student student) {
		studentMapper.addStudent(student);
	}
	
	@Override
	public List<Student> selectAllStudent() {
		List<Student> students = studentMapper.selectAllStudent();
		return students;
	}

	@Override
	public void deleteStudentById(Integer id) {
		studentMapper.deleteStudentById(id);
	}

	@Override
	public Student selectStudentById(Integer id) {
		Student student = studentMapper.selectStudentById(id);
		return student;
	}

	@Override
	public void updateStudentById(Student student) {
		studentMapper.updateStudentById(student);
	}

	@Override
	public List<Student> likeSelect(Student student) {
		List<Student> students = studentMapper.likeSelect(student);
		return students;
	}

	/*@Override
	public void delectStudentsByIds(String[] ids) {
		studentMapper.delectStudentsByIds(ids);
		
	}*/

	

	
}
