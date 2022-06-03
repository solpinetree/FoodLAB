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

@Controller
@RequestMapping("/restaurants")
public class RestaurantController {

	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class); // logger.info

	@Autowired
	private RestaurantService restaurantService;

	@RequestMapping(value = "/loadListDiv", produces = "application/text;charset=utf8")
	public String loadRestaurantListDivSelectedByCategory(Model model, @RequestParam("category") String category,
			@RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {

		Pagination pagination = restaurantService.getPaginationByCategory(currentPage, category);
		model.addAttribute("pagination", pagination);
		model.addAttribute("restaurants", restaurantService.findByCategoryWithPagination(pagination, category));
		model.addAttribute("category", category);

		return "restaurant/right-listing";
	}

	@RequestMapping(value = "/loadListDivBySearchKeyword", produces = "application/text;charset=utf8")
	public String loadRestaurantListDivSelectedBySearchKeyword(Model model,
			@RequestParam(required = false, defaultValue = "1") int currentPage, @RequestParam("search") String search)
			throws SQLException {

		Pagination pagination = restaurantService.getPaginationBySearchKeyword(currentPage, search);
		model.addAttribute("pagination", pagination);
		model.addAttribute("restaurants", restaurantService.findByNameWithPanination(pagination, search));
		model.addAttribute("search", search);
		
		return "restaurant/right-listing";
	}

	@GetMapping("/detail")
	public String restaurantDetail(@RequestParam(required = false) int restaurantId, Model model) throws SQLException {
		model.addAttribute("restaurants", restaurantService.selectById(restaurantId));
		return "restaurant/detail";
	}

}
