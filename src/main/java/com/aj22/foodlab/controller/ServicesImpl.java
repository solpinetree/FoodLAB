package com.aj22.foodlab.controller;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.context.ServletContextAware;

@Controller
public class ServicesImpl implements ServletContextAware {

	private ServletContext context;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;
	}

}
