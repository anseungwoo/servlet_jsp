package com.newlecture.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/spag")
public class Spag extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		int num = 0;
		String num_= requset.getParameter("n");
		 if(num_!=null &&!num_.equals(""))
			 num =Integer.parseInt(num_);
		String result;
		if (num % 2 != 0) {
			result = "홀수";

		} else {
			result = "짝수";

		}
		requset.setAttribute("result", result);
		
		String[] names= {"a","b","c","d"};
		requset.setAttribute("names", names);
		
		Map<String,Object> notice =new HashMap<String,Object>();
		notice.put("id", 1);
		notice.put("title", "1번");
		requset.setAttribute("notice", notice);
		
		RequestDispatcher dispatcher= requset.getRequestDispatcher("spag.jsp");
		dispatcher.forward(requset, response);
	}
	

}
