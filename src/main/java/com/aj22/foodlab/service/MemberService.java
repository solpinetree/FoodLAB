package com.aj22.foodlab.service;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.member.MemberDAO;
import com.aj22.foodlab.dao.member.MemberDAOImpl;
import com.aj22.foodlab.dao.retaurant.RestaurantDAO;
import com.aj22.foodlab.dao.retaurant.RestaurantDAOImpl;
import com.aj22.foodlab.dto.MemberDTO;

@Service
public class MemberService {

	public MemberDTO selectById(int id) throws SQLException{
		MemberDTO member = null;
		MemberDAO dao = new MemberDAOImpl();
		member = dao.selectById(id);
		dao.close();
		return member;
	}
	
	public String getusernameFromId(int id) throws SQLException {
		String name = null;
		MemberDAO dao = new MemberDAOImpl();
		name = dao.getMembernameById(id);
		dao.close();
		return name;
	}
	
	
	
	public Integer getMemberIdFromName(String name) throws SQLException {
		Integer id = null;
		MemberDAO dao = new MemberDAOImpl();
		id = dao.getMemberIdByname(name);
		dao.close();
		if(id!=null) {
		return id;
		}
		else {
		return 1;
		}
	}
}
