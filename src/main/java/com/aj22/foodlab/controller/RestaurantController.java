package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj22.foodlab.dto.CommentDTO;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.service.RestaurantService;
import com.aj22.foodlab.util.Pagination;
 
@Controller
@RequestMapping("/restaurants")
public class RestaurantController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class); // logger.info
	
	@Autowired
	private RestaurantService restaurantService;
	static final int NumOfRecordsPerPage = 12; //FIXME : ������湲� - ��鍮��ㅼ���� 
	
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
		

		
		int numOfRecords = restaurantService.getNumOfRecord_category(category); 
		String numOfRecords2 = Integer.toString(numOfRecords);
		logger.info(numOfRecords2);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("restaurants", restaurantService.selectList_category(pagination,category));
		model.addAttribute("categories", restaurantService.getCategories());
		logger.info(category);
		model.addAttribute("category", category);
		return "restaurant/restaurants";
	}
	

	private String html = "";
	
	@RequestMapping(value="/select_res2", produces="application/text;charset=utf8")
	@ResponseBody
	public String getcategory_ajax( Model model, @RequestParam("category") String category, @RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {
		int numOfRecords = restaurantService.getNumOfRecord_category(category); 
		String numOfRecords2 = Integer.toString(numOfRecords);
		logger.info(numOfRecords2);
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		html="";
		RestaurantService res = new RestaurantService();
		List<RestaurantDTO> categorys =  res.selectList_category(pagination,category);
		
		for(RestaurantDTO dto:categorys) {
			html += 
	            "<h1>OK</h1>";
		}
		
		return html;
	}
	
	
	@GetMapping("/search")
	public String restaurant_search(Model model, @RequestParam("seach_text") String search_text) throws SQLException {
		model.addAttribute("search_text",search_text);
		model.addAttribute("categories", restaurantService.getCategories());
		model.addAttribute("restaurants", restaurantService.selectByName(search_text));
		return "restaurant/restaurants";
	}
	
	
	@GetMapping("/search2")
	public String restaurant_search_ajax(Model model, @RequestParam("seach_text") String search_text) throws SQLException {
		model.addAttribute("search_text",search_text);
		model.addAttribute("categories", restaurantService.getCategories());
		model.addAttribute("restaurants", restaurantService.selectByName(search_text));
		
		html="";
		RestaurantService res = new RestaurantService();
		List<RestaurantDTO> search =  res.selectByName(search_text);
		
		for(RestaurantDTO dto:search) {
			html += 
	                "<div class='listing__details__comment__item'>" 
	              + 	"<div class='listing__details__comment__item__pic'>"
	      	      + 		"<img src='/foodlab/resources/img/defaultProfile.jpeg'>"
	              +		"</div>"
	      	      +		"<div class='listing__details__comment__item__text'>"
	              +			"<span>"+dto.getAddress()+"</span>"
	              +			"<h5>"+dto.getCategory()+"</h5>"
	              + 		"<p>"+dto.getName()+"</p>"
	              + 		"<button type='button' class='reply-btn' id="+ dto.getTel() + ">"
	              +				"<i class='fa fa-reply'></i> ����湲� �ш린"
	              +			"</button>"
	              +		"</div>"
	              +	"</div>";
		}
		
		return html;
	}
	
}
