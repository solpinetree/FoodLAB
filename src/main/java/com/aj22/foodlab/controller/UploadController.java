package com.aj22.foodlab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;


@Controller
public class UploadController implements ServletContextAware {
	
	public static ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext servletContext) {
		if(UploadController.servletContext == null) {
			UploadController.servletContext = servletContext;
		}
	}
	
}
