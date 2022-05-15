package com.aj22.foodlab.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aj22.foodlab.dto.MemberDTO;


public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html; charset=utf-8");
//		request.setCharacterEncoding("utf-8");
//		
//		String id = Integer.parseInt(request.getParameter("id"));
//		String password = request.getParameter("password");
//		
//		
//		
//		MemberDTO bean = new MemberDTO();
//		bean.setId(id);
//		bean.setPassword(password);
//		request.setAttribute("bean",bean);
//		
//		boolean status = bean.validate();
//		
//		if (status) {
//			RequestDispatcher rd = request.getRequestDispatcher("login_success.jsp");
//			rd.forward(request, response);
//			
//		}
//		else {
//			RequestDispatcher rd = request.getRequestDispatcher("login_error.jsp");
//			rd.forward(request, response);
//		}
//		
		

}
	
}
