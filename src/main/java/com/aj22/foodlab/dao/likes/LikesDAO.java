package com.aj22.foodlab.dao.likes;

import java.sql.SQLException;
import java.util.List;

import com.aj22.foodlab.domain.Likes;

public interface LikesDAO {
	List<Likes> selectByReviewId(int reviewId) throws SQLException;
	void close() throws SQLException;
}
