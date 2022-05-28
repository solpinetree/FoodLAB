package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/logins/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login( Model model) {
		logger.info("login.jsp 진입");
		
		return "/logins/login";
	}
		
	@RequestMapping(value = "/mypage", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypage( Model model) {
		logger.info("mypage.jsp 진입");
		
		return "/logins/mypage";
	}
	
	@RequestMapping(value = "/processAddMember", method = {RequestMethod.GET,RequestMethod.POST})
	public String res4( Model model) {
		logger.info("processAddMember.jsp 진입");
		
		return "/logins/processAddMember";
	}
	

		@GetMapping("/resultMember")
		public String resultMember_wellcome(Model model, @RequestParam("msg") String msg) throws SQLException {
			model.addAttribute("msg",msg);
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
	
	@RequestMapping(value = "/create_membership3", method = {RequestMethod.GET, RequestMethod.POST})
	public String res11( Model model) {
		logger.info("create_membership3.jsp 진입");
		
		return "/logins/create_membership3";
	}
	
	@RequestMapping(value = "/joinemailCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String res12( Model model) {
		logger.info("joinemailCheck.jsp 진입");
		
		return "/logins/joinemailCheck";
	}
	
	@RequestMapping(value = "/joinnameCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String res13( Model model) {
		logger.info("joinnameCheck.jsp 진입");
		
		return "/logins/joinnameCheck";
	}
	
	@RequestMapping(value = "/clause", method = {RequestMethod.GET, RequestMethod.POST})
	public String res14( Model model) {
		logger.info("clause.jsp 진입");
		
		return "/logins/clause";
	}
	
	@RequestMapping(value = "/emailSendAction", method = {RequestMethod.GET, RequestMethod.POST})
	public String res15( Model model) {
		logger.info("emailSendAction.jsp 진입");
		
		return "/logins/emailSendAction";
	}
	
	@RequestMapping(value = "/emailCheckAction", method = {RequestMethod.GET, RequestMethod.POST})
	public String res16( Model model) {
		logger.info("emailCheckAction.jsp 진입");
		
		return "/logins/emailCheckAction";
	}
	
	
	

	
	
	
	
	
	
	
}