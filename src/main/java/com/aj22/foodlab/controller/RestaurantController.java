package com.aj22.foodlab.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/restaurants")
public class RestaurantController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	
	@GetMapping("/list")
	public String res( Model model) {
		logger.info("restaurants.jsp 진입");
		
		return "restaurant/restaurants";
	}
	
	@GetMapping("/rank")
	public String restaurantRank( Model model) {
		logger.info("restaurant-ranking.jsp 진입");
		
		return "restaurant/ranking";
	}
	
	@GetMapping("/detail")
	public String restaurantDetail( Model model) {
		logger.info("detail.jsp 진입");
		
		return "restaurant/detail";
	}
	
}
