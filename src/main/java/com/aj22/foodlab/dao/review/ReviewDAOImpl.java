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
import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.service.MemberService;
import com.aj22.foodlab.service.RestaurantService;
import com.aj22.foodlab.util.ConnectionProvider;


public class ReviewDAOImpl implements ReviewDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private MemberService memberService;
	
	public ReviewDAOImpl() {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
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
				"(content, rate, member_id, restaurant_id) " +
				"VALUES(?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		pstmt.setString(1, review.getContent());
		pstmt.setInt(2, review.getRate());
		pstmt.setInt(3, review.getWriterId());
		pstmt.setInt(4, review.getRestaurantId());
		pstmt.executeUpdate();
		
		rs = pstmt.getGeneratedKeys();
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
		pstmt.setString(2, review.getContent());
		pstmt.setInt(4, review.getRate());
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
		String content = rs.getString("content");
		int rate = rs.getInt("rate");
		Timestamp createdAt = rs.getTimestamp("createdAt");
		Timestamp updatedAt = rs.getTimestamp("updatedAt");
		int writerId = rs.getInt("member_id");
		int restaurantId = rs.getInt("restaurant_id");
		
		review = new Review(reviewId, content, rate, createdAt, updatedAt,
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
		
		if(option.equals("searchAll")) {
		String sql = "select * from review where content LIKE concat('%',?,'%') order by createdAt desc limit ?, ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,keyword);
		pstmt.setInt(2, startIdx);
		pstmt.setInt(3, listSize);
		
		rs = pstmt.executeQuery();
		while (rs.next()) {
			reviews.add(createFromResultSet(rs));
		}

		
		return reviews;
		}
		
		if(option.equals("res")) {			
	
			String sql = "select * from review where dummy_restaurant_name LIKE concat('%',?,'%') order by createdAt desc limit ?, ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startIdx);
			pstmt.setInt(3, listSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				reviews.add(createFromResultSet(rs));
			}

			
			return reviews;
		}
		
		if(option.equals("writer")) {
			
			String sql = "select * from review where dummy_username LIKE concat('%',?,'%') order by createdAt desc limit ?, ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startIdx);
			pstmt.setInt(3, listSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				reviews.add(createFromResultSet(rs));
			}
		
			return reviews;
		}
		
		else {
		
		return reviews;
		
		}
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
		
		if(count!=0) {
			avg_rate = (float) (Math.round(sum/count*100)/100.0);
		}
		
		return avg_rate;
	}
	
	@Override
	public float reviewPriceSatisAvgRateSelectByRestaurantId(int id) throws SQLException{
		String sql = "select price_satisfaction from review where restaurant_id = ? ";
		float avgPriceSatisRate = 0;
		int count = 0;
		int sum = 0;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			count++;
			sum += rs.getInt("price_satisfaction");
			
		}
		
		if(count!=0) {
			avgPriceSatisRate = (float) (Math.round(sum/count*100)/100.0);
		}
		
		return avgPriceSatisRate;
	}

}
