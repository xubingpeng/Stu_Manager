package com.jxd.stu.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class AdminLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		if("login".equals(method)){
			login(request, response);
		}else if("logout".equals(method)){
			logout(request, response);
		}
		
	}
	private void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		// TODO Auto-generated method stub
		request.getSession().removeAttribute("adminName");
		response.sendRedirect("index.jsp");
	}

	private void login(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");

		if (name.equals("admin") && pwd.equals("123456")) {
			String currenttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			session.setAttribute("adminName", name);
			session.setAttribute("currenttime", currenttime);
			request.getRequestDispatcher("student?method=selectAll").forward(request, response);
		} else {
			request.setAttribute("error", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
			request.getRequestDispatcher("index.jsp")
					.forward(request, response);
	}
	

	}
}
