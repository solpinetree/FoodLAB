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
@RequestMapping("/restaurants")
public class RestaurantController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String res( Model model) {
		logger.info("restaurants.jsp 진입");
		

		return "restaurants";
	}
	
}
