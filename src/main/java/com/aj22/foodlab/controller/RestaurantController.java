package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		
		model.addAttribute("categories", restaurantService.getCategories());
		String list = "list";
		model.addAttribute("pagevalue",list);
		return "restaurant/restaurants";
		
	}
	
	@RequestMapping(value="/loadListDiv", produces="application/text;charset=utf8")
	public String restaurantListDivSelectedByCategory( Model model, @RequestParam("category") String category, @RequestParam(required = false, defaultValue = "1") int currentPage) throws SQLException {
		
		if(category.equals("general")) {	// 카테고리 선택 안한경우
			
			Pagination pagination = restaurantService.getPagination(currentPage);
			model.addAttribute("pagination", pagination);
			model.addAttribute("restaurants", restaurantService.selectList(pagination));
			
		}else {	// 카테고리 선택한 경우
			
			Pagination pagination = restaurantService.getPaginationOfCategory(currentPage, category);
			model.addAttribute("pagination", pagination);
			model.addAttribute("restaurants", restaurantService.findByCategoryWithPagination(pagination,category));
			model.addAttribute("pagevalue","select");
			model.addAttribute("category",category);
		}
		
		return "restaurant/right-listing";
	}
	
	
	@GetMapping("/detail")
	public String restaurantDetail(@RequestParam(required = false) int restaurantId, Model model) throws SQLException {
		model.addAttribute("restaurants", restaurantService.selectById(restaurantId));
		return "restaurant/detail";
	}
	
	private String html = "";
	
	
	
	@GetMapping("/search")
	public String restaurant_search(Model model, @RequestParam("seach_text") String search_text) throws SQLException {
		model.addAttribute("search_text",search_text);
		model.addAttribute("categories", restaurantService.getCategories());
		model.addAttribute("restaurants", restaurantService.selectByName(search_text));
		return "restaurant/restaurants";
	}
	

	@RequestMapping(value="/search2", produces="application/text;charset=utf8")
	@ResponseBody
	public String restaurant_search_ajax(Model model, @RequestParam("search_text") String search_text)  throws SQLException {
		model.addAttribute("search_text",search_text);
		model.addAttribute("categories", restaurantService.getCategories());
		model.addAttribute("restaurants", restaurantService.selectByName(search_text));
		logger.info("seach_text: "+search_text);
		html="";
		RestaurantService res = new RestaurantService();
		List<RestaurantDTO> search =  res.selectByName(search_text);
		
		for(RestaurantDTO dto:search) {
			html += 
			           "<div class='listing__item'>"  
		      
		           +"<div class='listing__item__pic set-bg' style=' cursor: pointer; background-image:url(\""+dto.getImgUrl()+"\");' onclick=\"location.href='http://158.247.206.153:8085/foodlab/restaurants/detail?restaurantId="+dto.getRestaurantId()+"';\"data-setbg=\""+dto.getImgUrl()+"\"" + " style=\"border-radius: 40px 40px 0 0;\">"
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
	
}
