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
	static final int NumOfRecordsPerPage = 12; //FIXME : 삭제하기 - 서비스에서 
	
	@GetMapping("/list")
	public String restaurantListPage( Model model, @RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {
		
		Pagination pagination = restaurantService.getPagination(currentPage);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("restaurants", restaurantService.selectList(pagination));
		model.addAttribute("categories", restaurantService.getCategories());
		return "restaurant/restaurants";
	}
	
	@GetMapping("/detail")
	public String restaurantDetail(@RequestParam(required = false) int restaurantId, Model model) throws SQLException {
		model.addAttribute("restaurants", restaurantService.selectById(restaurantId));
		return "restaurant/detail";
	}
	
	
	@GetMapping("/select_res")
	public String res2( Model model, @RequestParam("category") String category, @RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {
		
		
		Pagination pagination = restaurantService.getPaginationOfCategory(currentPage, category);
		
//		int numOfRecords = restaurantService.getNumOfRecord_category(category); 
//		String numOfRecords2 = Integer.toString(numOfRecords);
//		logger.info(numOfRecords2);
//		
//		Pagination pagination = new Pagination();
//		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("restaurants", restaurantService.selectList_category(pagination,category));
		model.addAttribute("categories", restaurantService.getCategories());
		logger.info(category);
		model.addAttribute("category", category);
		return "restaurant/restaurants";
	}
	
	
	@GetMapping("/search")
	public String restaurant_search(Model model, @RequestParam("seach_text") String search_text) throws SQLException {
		model.addAttribute("search_text",search_text);
		model.addAttribute("categories", restaurantService.getCategories());
		model.addAttribute("restaurants", restaurantService.selectByName(search_text));
		return "restaurant/restaurants";
	}
	
}
