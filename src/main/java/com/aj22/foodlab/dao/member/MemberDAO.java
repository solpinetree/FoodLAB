package com.aj22.foodlab.dao.member;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.dto.MemberDTO;

public interface MemberDAO {
	int insert(MemberDTO member) throws SQLException;
	void close() throws SQLException;
	int delete(int id) throws SQLException;
	int edit(MemberDTO member) throws SQLException;
	MemberDTO select(String email) throws SQLException;
	MemberDTO selectname(String username) throws SQLException;
	List<MemberDTO> selectList() throws SQLException;
	//List<ReviewDTO> selectListByCategory(String category) throws SQLException;
	String getMemberpasswordByEmail(String email) throws SQLException;
	MemberDTO selectById(int id) throws SQLException;
	String getMembernameById(int id) throws SQLException;
	Integer getMemberIdByname(String name) throws SQLException;
	int countRecordsByName(String name) throws SQLException;
}
