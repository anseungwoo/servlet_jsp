package com.newlecture.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add
 */
@WebServlet("/calc")
public class Calc extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String x_ = request.getParameter("x");
		String y_ = request.getParameter("y");
		String operator =request.getParameter("operator");
		int x=0;
		int y=0;
		if(!x_.equals("")) x=Integer.parseInt(x_);
		if(!y_.equals("")) y=Integer.parseInt(y_);
		int result =0;
		
		if(operator.equals("덧셈"))
			result=x+y;
		else
			result=x-y;
		response.getWriter().printf("result is %d\n", result);
	}

}
