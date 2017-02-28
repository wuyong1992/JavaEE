package com.xxx.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.xxx.model.Student;
import com.xxx.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentServiceImpl;
	
	/**
	 * 添加学生信息
	 * @param name
	 * @param age
	 * @param sex
	 * @return
	 */
	@RequestMapping("/add")
	public String add(String name, Integer age,String sex) {
		Student student = new Student();
		student.setName(name);
		student.setAge(age);
		student.setSex(sex);
		
		studentServiceImpl.add(student);
		return "redirect:/studentList.action";
	}
	
	/**
	 * 模型传参给视图解析
	 * @return
	 */
	@RequestMapping("/studentList.action")
	public ModelAndView studentList() {
		
		ModelAndView modelAndView = new ModelAndView();
		List<Student> students = studentServiceImpl.selectAllStudent();
		modelAndView.addObject("students", students);
		modelAndView.setViewName("studentList");
		return modelAndView;
	}
	
	/**
	 * 根据学生id删除某条信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteStudent")
	public String deleteStudentById(Integer id) {
		//执行删除，并返回列表界面
		studentServiceImpl.deleteStudentById(id);
		return "redirect:/studentList.action";
	}
	
	/**
	 * 根据id更新数据，
	 * 1.先找出该id对应的数据并封装，传递给jsp页面显示
	 * 2.根据页面输入的信息对该数据进行更改
	 * @param id
	 * @return
	 */
	@RequestMapping("/selectStudentById")
	public ModelAndView selectStudentById(Integer id) {
		ModelAndView modelAndView = new ModelAndView();
		Student student = studentServiceImpl.selectStudentById(id);
		
		modelAndView.addObject("student", student);
		modelAndView.setViewName("updateStudentById");
		return modelAndView;
	}
	
	/**
	 * 根据id修改
	 * @param id
	 * @return
	 */
	@RequestMapping("/updateStudentById")
	public String updateStudentById(Student student) {
		studentServiceImpl.updateStudentById(student);
		return "redirect:/studentList.action";
	}
	
	/**
	 * 模糊查询
	 * @param student
	 * @return
	 */
	@RequestMapping("/select")
	public ModelAndView likeSelect(Student student) {
		ModelAndView modelAndView =new ModelAndView();
		List<Student> students =studentServiceImpl.likeSelect(student);
		modelAndView.addObject("students", students);
		modelAndView.setViewName("likeSelect");
		return modelAndView;
	}
	
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delectStudentsByIds")
	public String delectStudentsByIds(String[] ids,HttpServletRequest request) {
		ids = request.getParameterValues("checkID");
		for (int i = 0; i < ids.length; i++) {
			int a = Integer.parseInt(ids[i]);
			studentServiceImpl.deleteStudentById(a);
		}
		return "redirect:/studentList.action";
	}
	
}









