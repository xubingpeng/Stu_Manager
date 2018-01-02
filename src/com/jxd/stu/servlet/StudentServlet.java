package com.jxd.stu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.el.lang.ELArithmetic.BigIntegerDelegate;

import com.jxd.stu.dao.IAdminDao;
import com.jxd.stu.dao.impl.AdminDaoImpl;
import com.jxd.stu.po.Student;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		if (method.equals("selectAll")) {
			selectAll(request, response);
		} else if (method.equals("insert")) {
			insert(request, response);
		} else if (method.equals("delete")) {
			delete(request, response);
		} else if (method.equals("update")) {
			update(request, response);
		} else if (method.equals("getStudent")) {
			getStudent(request, response);
		} else if (method.equals("selectByFilter")) {
			selectByFilter(request, response);
		}

	}

	private void selectByFilter(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IAdminDao admindao = new AdminDaoImpl();
		HttpSession session = request.getSession();
		String sub = request.getParameter("projectPorperty");
		request.setAttribute("projectPorperty", sub);
		String min =request.getParameter("min");
		if(min==null||min=="")
		{
		 min="0";
		}
		int min2 =Integer.parseInt(min);
		request.setAttribute("min", min);
		String max =request.getParameter("max");
		if(max==null||max=="")
		{
		 max="100";
		}
		int max2 =Integer.parseInt(max);
		request.setAttribute("max", max);
		List list = admindao.selectByFilter(sub, min2, max2);
		if (list != null) {
			session.setAttribute("studentList", list);
		}
		request.getRequestDispatcher("main.jsp").forward(request,
				response);

	}

	private void getStudent(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int studentid = Integer.parseInt(request.getParameter("studentid"));
		IAdminDao admindao = new AdminDaoImpl();
		Student student = admindao.selectById(studentid);
		if (student != null) {
			HttpSession session = request.getSession();
			session.setAttribute("student", student);
			request.getRequestDispatcher("update.jsp").forward(request,
					response);
		}
	}

	private void selectAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		IAdminDao admindao = new AdminDaoImpl();
		List list = admindao.SelectAll();
		if (list != null) {
			session.setAttribute("studentList", list);
		}
		request.getRequestDispatcher("main.jsp").forward(request, response);

	}

	private void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		IAdminDao admin = new AdminDaoImpl();
		Student student = new Student();
		student.setNAME(request.getParameter("name"));
		student.setSEX(request.getParameter("sex"));
		try {
			student.setDATETIME(new SimpleDateFormat("yyyy-MM-dd")
					.parse(request.getParameter("datetime")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		student.setPHONE(Long.parseLong(request.getParameter("phone")));
		student.setCLASS(request.getParameter("class"));
		student.setCHINESE(Integer.parseInt(request.getParameter("chinese")));
		student.setMATHS(Integer.parseInt(request.getParameter("maths")));
		student.setENGLISH(Integer.parseInt(request.getParameter("english")));

		int rs = admin.insert(student);
		if (rs == 0) {
			request.setAttribute("error", "添加失败");
			request.getRequestDispatcher("insert.jsp").forward(request,
					response);
		} else {
			selectAll(request, response);
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		IAdminDao admin = new AdminDaoImpl();
		String[] bat = request.getParameterValues("checkBox");
		if(bat==null){
			//out.print("<script>alert('请选择你要删除的学生');window.location.href='main.jsp'</script>");
			//window.history.go(-1)
			selectAll(request, response);
		}else{
			int m = 0;
			for (int i = 0; i < bat.length; i++) {
				m = admin.delete(Integer.parseInt(bat[i]));
			}
			selectAll(request, response);
		}
		}

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		IAdminDao admin = new AdminDaoImpl();
		Student student = new Student();
		student.setID(Integer.parseInt(request.getParameter("id")));
		student.setNAME(request.getParameter("name"));
		student.setSEX(request.getParameter("sex"));
		try {
			student.setDATETIME(new SimpleDateFormat("yyyy-MM-dd")
					.parse(request.getParameter("datetime")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		student.setPHONE(Long.parseLong(request.getParameter("phone")));
		student.setCLASS(request.getParameter("class"));
		student.setCHINESE(Integer.parseInt(request.getParameter("chinese")));
		student.setMATHS(Integer.parseInt(request.getParameter("maths")));
		student.setENGLISH(Integer.parseInt(request.getParameter("english")));

		int rs = admin.update(student);
		if (rs == 0) {
			request.setAttribute("error", "更新失败");
		}
		selectAll(request, response);

	}

	public void init() throws ServletException {
	}

}
