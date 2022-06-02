package com.aj22.foodlab.service;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.member.MemberDAO;
import com.aj22.foodlab.dao.member.MemberDAOImpl;
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
	
}
