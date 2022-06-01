package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

	private String html = "";
	
	@RequestMapping(value="/select_res2", produces="application/text;charset=utf8")
	@ResponseBody
	public String getcategory_ajax( Model model, @RequestParam("category") String category, @RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {
		logger.info("category: "+category);
		int numOfRecords = restaurantService.getNumOfRecord_category(category); 
		String numOfRecords2 = Integer.toString(numOfRecords);
		logger.info(numOfRecords2);
		Pagination pagination = new Pagination();
		pagination.pageInfo(currentPage, numOfRecords, NumOfRecordsPerPage);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("restaurants", restaurantService.selectList_category(pagination,category));
		model.addAttribute("categories", restaurantService.getCategories());
		model.addAttribute("category", category);
		
		html="";
		RestaurantService res = new RestaurantService();
		List<RestaurantDTO> categorys =  res.selectList_category(pagination,category);
		
		for(RestaurantDTO dto:categorys) {
			html += 
			           "<div class='listing__item'>"  
		      
		           +"<div class='listing__item__pic set-bg' style=' cursor: pointer;' onclick='location.href='/foodlab/restaurants/detail?restaurantId="+dto.getRestaurantId()+"';' data-setbg='"+dto.getImgUrl()+"' style='border-radius: 40px 40px 0 0;'>"	
		           +       "<div class='listing__item__pic__tag' style='background: #f9adbd'>"+dto.getCategory()+"</div>"
		           +       "<div class='listing__item__pic__btns'>"
		           +           "<div class='listing__item__pic__btns'>"
	               +            	"<a href='#'><span class='icon_heart_alt'></span></a>"
	               +           "</div>"
		           +       "</div>"
		           +   "</div>"
		          
		      
		           
		           +   "<div class='listing__item__text'>"
		           +       "<div class='listing__item__text__inside'>"
		           +           "<h5>"+dto.getName()+"</h5>"
		           +           "<div class='listing__item__text__rating'>"
		           +               "<div class='listing__item__rating__star'>"
		           +                   "<span class='icon_star'></span>"
		           +                   "<span class='icon_star'></span>"
		           +                   "<span class='icon_star'></span>"
		           +                   "<span class='icon_star'></span>"
		           +                   "<span class='icon_star-half_alt'></span>"
		           +               "</div>"
		           +           "</div>"
		           +           "<ul>"
		           +               "<li><span class='icon_pin_alt'></span>"+ dto.getAddress() +"</li>"
		           +               "<li><span class='icon_phone'></span>"+ dto.getTel() +"</li>"
		           +               "<li><span class='icon_archive_alt'></span> 누적 리뷰수 : <text style='font-weight: bold;'>120</text></li>"                       
		           +           "</ul>"
		           +       "</div>"
		           +       "<div class='listing__item__text__info'>"
		                      
		           +           "<div class='listing__item__text__info__right'>"+dto.getOperationHour() +"</div>"
		           +       "</div>"
		           +   "</div>"
		          +"</div>";
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
