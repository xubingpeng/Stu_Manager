package com.jxd.stu.dao;

import java.util.List;

import com.jxd.stu.po.Student;

public interface IAdminDao {
	
	List SelectAll();
	int insert(Student student);
	int update(Student student);
	int delete(int ID);
	Student selectById(int ID);
	List selectByFilter(String sub,Integer min,Integer max);
	

}
