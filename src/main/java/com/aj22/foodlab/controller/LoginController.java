package com.aj22.foodlab.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aj22.foodlab.dto.MemberDTO;
import com.aj22.foodlab.service.ArchivedRestaurantService;
import com.aj22.foodlab.service.LikesService;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("member")
@RequestMapping("/logins/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	ArchivedRestaurantService archivedRestaurantService;
	@Autowired
	LikesService likesService;
	
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login( Model model) {
		logger.info("login.jsp 진입");
		
		return "/logins/login";
	}
		
	@RequestMapping(value = "/mypage", method = {RequestMethod.GET,RequestMethod.POST})
	public String mypage(Model model, HttpServletRequest request) throws SQLException {
		logger.info("mypage.jsp 진입");
		
		MemberDTO sessionMember = (MemberDTO) request.getSession().getAttribute("sessionMember");
		
		if(sessionMember!=null) {
			model.addAttribute("archivedRestaurants", archivedRestaurantService.getRestaurantsByMemberId(sessionMember.getId()));
			model.addAttribute("archivedReviews", likesService.getReviewsByMemberId(sessionMember.getId()));
		}
		
		return "/logins/mypage";
	}
	
	@GetMapping("/processAddMember")
	public String processAddMember(Model model, @RequestParam("email") String email
			, @RequestParam("password") String password, @RequestParam("name") String name) throws SQLException {
		logger.info("processAddMember.jsp 진입");
		
		model.addAttribute("email",email);
		model.addAttribute("password",password);
		model.addAttribute("name",name);
		

		return "/logins/processAddMember";
	
	}

		@GetMapping("/resultMember")
		public String resultMember_wellcome(Model model, @RequestParam("msg") String msg) throws SQLException {
			
			logger.info("resultMember.jsp 진입");
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