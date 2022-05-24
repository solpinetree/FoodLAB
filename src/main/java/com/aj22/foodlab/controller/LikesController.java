package com.aj22.foodlab.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aj22.foodlab.service.LikesService;

@Controller
@RequestMapping("/likes")
public class LikesController {

	@Autowired
	LikesService likesService;
	
	@PostMapping("/toggle")
	public void toggleLikes(@RequestParam int reviewId, HttpServletRequest request) {
		//int memberId = (MemberDTO)request.getSession().getAttribute("sessionMember")
		//likesService.toggle(new Like());
	}
}
