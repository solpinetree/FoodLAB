package com.aj22.foodlab.dao.member;

import java.util.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.aj22.foodlab.dto.MemberDTO;
import com.aj22.foodlab.dto.RestaurantDTO;
import com.aj22.foodlab.util.ConnectionProvider;
import com.aj22.foodlab.dao.retaurant.RestaurantDAO;

public class MemberDAOImpl implements MemberDAO {

	String DB_PROPERTIES = "?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true"; // MySQL Connector J 8.0
	String DB_SCHEMAS = "foodlab";
	String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // deprecated "com.mysql.jdbc.Driver"; // try
														// "com.mysql.cj.jdbc.Driver"
	String DB_URL = "jdbc:mysql://localhost/" + DB_SCHEMAS + DB_PROPERTIES;
	String USER = "labadmin";
	String PASS = "1234";
	// Class.forName("com.mysql.cj.jdbc.Driver");

	// Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	// FoodDAOImpl 객체가 생성될때 Connection도 생성된다.
	public MemberDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB 자원 반납
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

	@Override
	public int insert(MemberDTO member) throws SQLException {

		int cnt = 0;

		String sql = "INSERT INTO member" + "(Username,email,password,userEmailChecked) " + "VALUES(?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getUsername());
		pstmt.setString(2, member.getEmail());
		pstmt.setString(3, member.getPassword());
		pstmt.setLong(4, member.getUserEmailChecked());

		cnt = pstmt.executeUpdate();

		return cnt;
	}

	@Override
	public int delete(int id) throws SQLException {
		int cnt = 0;

		String sql = "delete from member where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	@Override
	public int edit(MemberDTO member) throws SQLException {

		int cnt = 0;

		String sql = "update member set username=?,email=?,password=?,userEmailChecked=? where member_id=?";
		pstmt.setString(1, member.getUsername());
		pstmt.setString(2, member.getEmail());
		pstmt.setString(3, member.getPassword());
		pstmt.setLong(4, member.getUserEmailChecked());

		cnt = pstmt.executeUpdate();

		return cnt;
	}

	@Override
	public MemberDTO select(String email) throws SQLException {

		MemberDTO member = new MemberDTO();

		String sql = "select * from member where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			member = createFromResultSet(rs);
		}

		return member;
	}

	public MemberDTO selectname(String name) throws SQLException {

		MemberDTO member = new MemberDTO();

		String sql = "select * from member where username=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			member = createFromResultSet(rs);
		}

		return member;
	}

	public MemberDTO createFromResultSet(ResultSet rs) throws SQLException {

		MemberDTO member = null;

		int memberId = rs.getInt("member_id");
		String username = rs.getString("username");
		String email = rs.getString("email");
		String password = rs.getString("password");
		String profile_img_origin_name = rs.getString("profile_img_origin_name");
		String profile_img_saved_name = rs.getString("profile_img_saved_name");
		String profile_img_saved_path = rs.getString("profile_img_saved_path");
		int userEmailChecked = rs.getInt("userEmailChecked");

		member = new MemberDTO(memberId, username, email, password, profile_img_origin_name, profile_img_saved_name,
				profile_img_saved_path, userEmailChecked);

		return member;
	}

	@Override
	public List<MemberDTO> selectList() throws SQLException {

		List<MemberDTO> members = new ArrayList<>();

		String sql = "select * from member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			members.add(createFromResultSet(rs));
		}

		return members;
	}

	@Override
	public String getMemberpasswordByEmail(String email) throws SQLException {

		String password = null;

		String sql = "select password from member where email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			password = rs.getString("email");
		}

		return password;
	}

	@Override
	public MemberDTO selectById(int id) throws SQLException {

		MemberDTO member = null;

		String sql = "select * from member where member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			member = createFromResultSet(rs);
		}

		return member;

	}

}
