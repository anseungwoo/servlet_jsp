package com.newlecture.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/calculator")
public class Calculator extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(req.getMethod().equals("GET")) {
			System.out.println("GET 요청이 옴");
		}
		else if(req.getMethod().equals("POST")) {
			System.out.println("POST 요청이 옴");
			
			
		}
		super.service(req, resp);

		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("GET 요청이 옴");
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("POST 요청이 옴");
	
	}

}
