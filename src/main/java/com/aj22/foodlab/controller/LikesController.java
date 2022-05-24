package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj22.foodlab.domain.Likes;
import com.aj22.foodlab.dto.MemberDTO;
import com.aj22.foodlab.service.LikesService;

@Controller
@RequestMapping("/likes")
public class LikesController {

	@Autowired
	LikesService likesService;
	
	@PostMapping("/toggle")
	@ResponseBody
	public Map<String, Object> toggleLikes(@RequestParam int reviewId, HttpServletRequest request) throws SQLException {
		Map<String, Object> res = new HashMap<>();
		int memberId = ((MemberDTO) request.getSession().getAttribute("sessionMember")).getId();
		likesService.toggle(new Likes(memberId, reviewId));
		
		res.put("likesCount", likesService.getLikesCount(reviewId));
		res.put("heartImgUrl", likesService.getHeartImgUrl(new Likes(memberId, reviewId)));
		
		return res;
	}
}
