package com.jxd.stu.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.jxd.stu.dao.IAdminDao;
import com.jxd.stu.po.Student;
import com.jxd.stu.util.DBUtil;

public class AdminDaoImpl implements IAdminDao {
	DBUtil dbutil = new DBUtil();

	@Override
	public List SelectAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM student ORDER BY ID";
		List list = new ArrayList();

		try {
			list = dbutil.getQueryList(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int insert(Student student) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "INSERT INTO student (`NAME`, `SEX`, `DATETIME`, `PHONE`, `CLASS`, `CHINESE`, `MATHS`, `ENGLISH`) VALUES(?,?,?,?,?,?,?,?)";
		Object[] paramList = { student.getNAME(), student.getSEX(),
				student.getDATETIME(), student.getPHONE(), student.getCLASS(),
				student.getCHINESE(), student.getMATHS(), student.getENGLISH() };

		try {
			rs = dbutil.execute(sql, paramList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public int update(Student student) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "update student set `NAME`=?, `SEX`=?, `DATETIME`=?, `PHONE`=?, `CLASS`=?, `CHINESE`=?, `MATHS`=?, `ENGLISH`=? where ID=?";
		Object[] paramList = { student.getNAME(), student.getSEX(),
				student.getDATETIME(), student.getPHONE(), student.getCLASS(),
				student.getCHINESE(), student.getMATHS(), student.getENGLISH(),
				student.getID() };

		try {
			rs = dbutil.execute(sql, paramList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public int delete(int ID) {
		// TODO Auto-generated method stub
		int rs = 0;
		String sql = "delete from student where ID=?";
		Object[] paramList = { ID };

		try {
			rs = dbutil.execute(sql, paramList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public Student selectById(int ID) {
		// TODO Auto-generated method stub
		Student student = new Student();
		String sql = "select * from student where ID=?";
		Object[] paramList = { ID };
		try {
			student = (Student) dbutil.getObject(Student.class, sql, paramList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return student;
	}

	@Override
	public List selectByFilter(String sub, Integer min, Integer max) {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		String where = "where 1=1 ";
		if (sub.equals("1")) {
			where += "and CHINESE>=" + min + " and CHINESE<=" + max;
		} else if (sub.equals("2")) {
			where += "and MATHS>=" + min + " and MATHS<=" + max;
		} else if (sub.equals("3")) {
			where += "and ENGLISH>=" + min + " and ENGLISH<=" + max;
		}
		String sql = "select * from student " + where;
		try {
			list = dbutil.getQueryList(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
