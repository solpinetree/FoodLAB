package com.aj22.foodlab.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aj22.foodlab.service.RestaurantService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/restaurants")
public class RestaurantController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class); // logger.info
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("/list")
	public String res( Model model) throws SQLException {
		model.addAttribute("restaurants", restaurantService.getRestaurants());
		model.addAttribute("categories", restaurantService.getCategories());
		return "restaurant/restaurants";
	}
	
	@GetMapping("/detail")
	public String restaurantDetail( Model model) {
		
		return "restaurant/detail";
	}
	
}
