package com.aj22.foodlab.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aj22.foodlab.service.RestaurantService;
import com.aj22.foodlab.util.Pagination;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/restaurants")
public class RestaurantController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class); // logger.info
	
	@Autowired
	private RestaurantService restaurantService;
	static final int NumOfRecordsPerPage = 12;
	
	@GetMapping("/list")
	public String res( Model model, @RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {
		
		int numOfRecords = restaurantService.getNumOfRecord();
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("restaurants", restaurantService.selectList(pagination));
		model.addAttribute("categories", restaurantService.getCategories());
		return "restaurant/restaurants";
	}
	
	@GetMapping("/detail")
	public String restaurantDetail( Model model) {
		
		return "restaurant/detail";
	}
	
}
