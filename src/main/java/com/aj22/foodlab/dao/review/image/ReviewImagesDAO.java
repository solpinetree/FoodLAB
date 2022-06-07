package com.aj22.foodlab.dao.review.image;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.domain.ReviewImages;

public interface ReviewImagesDAO {
	int insert(ReviewImages reviewImage) throws SQLException;
	void close() throws SQLException;
	List<ReviewImages> select(int id) throws SQLException;
	List<ReviewImages> selectByRestaurantId(int restaurantId) throws SQLException;
}
