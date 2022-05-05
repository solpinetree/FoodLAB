package com.aj22.foodlab.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/logins/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String res( Model model) {
		logger.info("login.jsp 진입");
		
		return "/logins/login";
	}
	
	@RequestMapping(value = "/login_success", method = {RequestMethod.GET,RequestMethod.POST})
	public String res2( Model model) {
		logger.info("login_success.jsp 진입");
		
		return "/logins/login_success";
	}
	
	@RequestMapping(value = "/mypage", method = {RequestMethod.GET,RequestMethod.POST})
	public String res3( Model model) {
		logger.info("mypage.jsp 진입");
		
		return "/logins/mypage";
	}
	
	@RequestMapping(value = "/processAddMember", method = {RequestMethod.GET,RequestMethod.POST})
	public String res4( Model model) {
		logger.info("processAddMember.jsp 진입");
		
		return "/logins/processAddMember";
	}
	
	@RequestMapping(value = "/resultMember", method = {RequestMethod.GET,RequestMethod.POST})
	public String res5( Model model) {
		logger.info("resultMember.jsp 진입");
		
		return "/logins/resultMember";
	}
	
	
	@RequestMapping(value = "/processLoginMember", method = {RequestMethod.GET,RequestMethod.POST})
	public String res6( Model model) {
		logger.info("processLoginMember.jsp 진입");
		
		return "/logins/processLoginMember";
	}
	
	@RequestMapping(value = "/logoutMember", method = {RequestMethod.GET,RequestMethod.POST})
	public String res7( Model model) {
		logger.info("logoutMember.jsp 진입");
		
		return "/logins/logoutMember";
	}
	
	@RequestMapping(value = "/index", method = {RequestMethod.GET,RequestMethod.POST})
	public String res8( Model model) {
		logger.info("index.jsp 진입");
		
		return "/logins/index";
	}
	
	@RequestMapping(value = "/create_membership", method = RequestMethod.GET)
	public String res9( Model model) {
		logger.info("create_membership.jsp 진입");
		
		return "/logins/create_membership";
	}
	
	@RequestMapping(value = "/email_access", method = RequestMethod.GET)
	public String res10( Model model) {
		logger.info("email_access.jsp 진입");
		
		return "/logins/email_access";
	}
	
	
	
	
	

	
	
	
	
	
	
	
}