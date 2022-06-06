package com.aj22.foodlab.dao.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.aj22.foodlab.controller.ReviewController;
import com.aj22.foodlab.dao.member.MemberDAO;
import com.aj22.foodlab.dao.member.MemberDAOImpl;
import com.aj22.foodlab.dao.retaurant.RestaurantDAO;
import com.aj22.foodlab.dao.retaurant.RestaurantDAOImpl;
import com.aj22.foodlab.dao.retaurant.menu.RestaurantMenuDAO;
import com.aj22.foodlab.dao.retaurant.menu.RestaurantMenuDAOImpl;
import com.aj22.foodlab.domain.Restaurant;
import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.service.MemberService;
import com.aj22.foodlab.service.RestaurantService;
import com.aj22.foodlab.util.ConnectionProvider;


public class ReviewDAOImpl implements ReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private MemberService memberService;
	
	// FoodDAOImpl 媛앹껜媛� �깮�꽦�맆�븣 Connection�룄 �깮�꽦�맂�떎.
	public ReviewDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB �옄�썝 諛섎궔
	@Override
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(pstmt != null) pstmt.close();			
		if(conn != null) conn.close();
	}

	@Override
	public Integer insert(Review review) throws SQLException {
		
		Integer autoIncrement = null;

		String sql = "INSERT INTO review" + 
				"(number_in_party, content, price_satisfaction, rate, title, member_id, restaurant_id) " + 
				"VALUES(?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		pstmt.setInt(1, review.getNumberInParty());
		pstmt.setString(2, review.getContent());
		pstmt.setInt(3, review.getPriceSatisfaction());
		pstmt.setInt(4, review.getRate());
		pstmt.setString(5, review.getTitle());
		pstmt.setInt(6, review.getWriterId());
		pstmt.setInt(7, review.getRestaurantId());
		pstmt.executeUpdate();
		
		rs = pstmt.getGeneratedKeys(); 	// 荑쇰━ �떎�뻾 �썑 �깮�꽦�맂 AI 媛� 諛섑솚
		if(rs.next()) {
			autoIncrement = rs.getInt(1);
		}
		
		return autoIncrement;
	}

	@Override
	public int delete(int id) throws SQLException {
		int cnt = 0;
		
		String sql = "delete from review where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		cnt = pstmt.executeUpdate();

		return cnt;
	}

	@Override
	public int edit(Review review) throws SQLException {
		
		int cnt = 0;

		String sql = "update review set number_in_party=?, content=?, price_satisfaction=?, rate=?,"
				+ " title=?, updatedAt=?, restaurant_id=? where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, review.getNumberInParty());
		pstmt.setString(2, review.getContent());
		pstmt.setInt(3, review.getPriceSatisfaction());
		pstmt.setInt(4, review.getRate());
		pstmt.setString(5, review.getTitle());
		pstmt.setTimestamp(6, review.getUpdatedAt());
		pstmt.setInt(7, review.getRestaurantId());
		pstmt.setInt(8, review.getWriterId());
		cnt = pstmt.executeUpdate();
	
		return cnt;
	}

	@Override
	public Review select(int id) throws SQLException {
		
		Review review = new Review();
		
		String sql = "select * from review where review_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			review = createFromResultSet(rs);
		}
	
		
		return review;
	}
	
	@Override
	public List<Review> selectByRestaurantId(int id) throws SQLException {
		
		List<Review> reviews = new ArrayList<>();
		
		String sql = "select * from review where restaurant_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			reviews.add(createFromResultSet(rs));
		}
	
		
		return reviews;
	}
	
	public Review createFromResultSet(ResultSet rs) throws SQLException {
		
		Review review = null;
		
		int reviewId = rs.getInt("review_id");
		int numberInParty = rs.getInt("number_in_party");
		String content = rs.getString("content");
		int priceSatisfaction = rs.getInt("price_satisfaction");
		int rate = rs.getInt("rate");
		String title = rs.getString("title");
		Timestamp createdAt = rs.getTimestamp("createdAt");
		Timestamp updatedAt = rs.getTimestamp("updatedAt");
		int writerId = rs.getInt("member_id");
		int restaurantId = rs.getInt("restaurant_id");
		
		review = new Review(reviewId, numberInParty, content, priceSatisfaction, rate, title, createdAt, updatedAt,
				 writerId, restaurantId);
	
		return review;
	}

	@Override
	public List<Review> selectList(int startIdx, int listSize) throws SQLException {
		
		List<Review> reviews = new ArrayList<>();
		
		String sql = "select * from review order by createdAt desc limit ?, ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startIdx);
		pstmt.setInt(2, listSize);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			reviews.add(createFromResultSet(rs));
		}

		
		return reviews;
	}
	
	@Override
	public List<Review> selectList(int startIdx, int listSize, String keyword, String option) throws SQLException {
		
		List<Review> reviews = new ArrayList<>();
		
		
		
		if(option == "all") {
		String sql = "select * from review where content LIKE concat('%',?,'%') OR title LIKE concat('%',?,'%') order by createdAt desc limit ?, ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, keyword);
		pstmt.setString(2, keyword);
		pstmt.setInt(3, startIdx);
		pstmt.setInt(4, listSize);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			reviews.add(createFromResultSet(rs));
		}

		
		return reviews;
		}
		
		if(option == "res") {
			
			
			int res_id = restaurantService.getRestaurantIdFromName(keyword);
	
			String sql = "select * from restaurant where restaurant_id=? order by createdAt desc limit ?, ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_id);
			pstmt.setInt(2, startIdx);
			pstmt.setInt(3, listSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				reviews.add(createFromResultSet(rs));
			}

			
			return reviews;
		}
		
		if(option == "writer") {
			
			int member_id = memberService.getMemberIdFromName(keyword);			
	
			String sql = "select * from member where member_id=? order by createdAt desc limit ?, ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.setInt(2, startIdx);
			pstmt.setInt(3, listSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				reviews.add(createFromResultSet(rs));
			}
		
			return reviews;
		}
		
		return reviews;
	}
	
	@Override
	public List<Review> findContentBySearchWithLimit(int startIdx, int listSize,String search) throws SQLException {
		
		List<Review> reviews = new ArrayList<>();
		
		String sql = "select * from review where content LIKE concat('%',?,'%') OR title LIKE concat('%',?,'%') limit ?, ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, search);
		pstmt.setString(2, search);
		pstmt.setInt(3, startIdx);
		pstmt.setInt(4, listSize);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			reviews.add(createFromResultSet(rs));
		}
	
		
		return reviews;
	}
	
	@Override
	public int countRecords() throws SQLException{
		int cnt = 0;
		
		String sql = "select count(*) from review";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		return cnt;
	}
	
	@Override
	public int countRecordsByRestaurantId(int restaurantId) throws SQLException{
		int cnt = 0;
		
		String sql = "select count(*) from review where restaurant_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, restaurantId);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		return cnt;
	}

	@Override
	public float reviewAvgRateSelectByRestaurantId(int id) throws SQLException{
		String sql = "select rate from review where restaurant_id = ? ";
		float avg_rate = 0;
		int count = 0;
		int sum = 0;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			count++;
			sum += rs.getInt("rate");
			
		}
		avg_rate = (float) (Math.round(sum/count*100)/100.0);
		
		return avg_rate;
	}
	
	
	@Override
	public int countRecords(String name, int member_id, int restaurant_id, String option) throws SQLException{
		int cnt = 0;
		logger.info("option="+option);
		if(option == "searchAll") {
		String sql = "select count(*) from review where content LIKE concat('%',?,'%') OR title LIKE concat('%',?,'%')";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, name);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		return cnt;
		
		}
		
		if(option=="res") {
			RestaurantDAO dao = new RestaurantDAOImpl();
			cnt = dao.countRecordsByName(name);
			return cnt;
	
		}
		
		if(option=="writer") {
			MemberDAO dao = new MemberDAOImpl();
			cnt = dao.countRecordsByName(name);
			return cnt;
		}
		
		else
			return 5;
	}

	@Override
	public int countRecordsByName(String name, String option, int member_id, int restaurant_id) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



}
