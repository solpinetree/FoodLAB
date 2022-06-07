package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj22.foodlab.domain.ArchivedRestaurant;
import com.aj22.foodlab.service.ArchivedRestaurantService;

@Controller
@RequestMapping("/archive")
public class ArchiveProcessController {
	
	@Autowired
	ArchivedRestaurantService archivedRestaurantService;
	
	@PostMapping("/delete")
	@ResponseBody
	public void deleteArchive(@RequestParam Map<String, String> map) throws SQLException {
		int restaurantId = Integer.parseInt(map.get("restaurantId"));
		int memberId =  Integer.parseInt(map.get("memberId"));
		
		archivedRestaurantService.delete(new ArchivedRestaurant(memberId, restaurantId));
	}

	@PostMapping("/insert")
	@ResponseBody
	public void insertArchive(@RequestParam Map<String, String> map) throws SQLException {
		int restaurantId = Integer.parseInt(map.get("restaurantId"));
		int memberId =Integer.parseInt(map.get("memberId"));
		
		archivedRestaurantService.insert(new ArchivedRestaurant(memberId, restaurantId));
	}
	
}
