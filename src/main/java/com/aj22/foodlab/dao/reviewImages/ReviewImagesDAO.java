package com.aj22.foodlab.dao.reviewImages;

import java.sql.SQLException;

import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.domain.ReviewImages;

public interface ReviewImagesDAO {
	int insert(ReviewImages reviewImage) throws SQLException;
	void close() throws SQLException;
}
