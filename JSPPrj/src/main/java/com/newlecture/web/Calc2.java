package com.newlecture.web;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Add
 */
@WebServlet("/calc2")
public class Calc2 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application=request.getServletContext();
		HttpSession session= request.getSession();
		String value_ = request.getParameter("value");
		String op =request.getParameter("operator");
		int value=0;
	
		if(!value_.equals("")) value=Integer.parseInt(value_);
		if(op.equals("=")) {
			int result =0;
//			int x =(Integer)application.getAttribute("value");
			int x =(Integer)session.getAttribute("value");
			int y =value;
//			String operator=(String)application.getAttribute("operator");
			String operator=(String)session.getAttribute("operator");
			if(operator.equals("+"))
				result=x+y;
			else if(operator.equals("-"))
				result=x-y;
			response.getWriter().printf("result is %d\n", result);
			
		}else {
		
			session.setAttribute("value", value);
			session.setAttribute("operator", op);
//		application.setAttribute("value", value);
//		application.setAttribute("operator", op);
		}
	

	
	}

}
