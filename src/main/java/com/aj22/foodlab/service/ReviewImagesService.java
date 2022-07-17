package com.aj22.foodlab.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aj22.foodlab.dao.review.image.ReviewImagesDAO;
import com.aj22.foodlab.dao.review.image.ReviewImagesDAOImpl;
import com.aj22.foodlab.domain.Review;
import com.aj22.foodlab.domain.ReviewImages;
import com.aj22.foodlab.dto.FileDTO;
import com.aj22.foodlab.util.FileUpload;
//import com.aj22.foodlab.util.S3FileUploadService;

@Service
public class ReviewImagesService {
	
	@Autowired
	FileUpload fileUpload;

	public int save(ReviewImages reviewImage) throws SQLException{
		ReviewImagesDAO dao = new ReviewImagesDAOImpl();
		int res = dao.insert(reviewImage);
		dao.close();
		return res;
	}
	
	public void saveReviewImages(MultipartHttpServletRequest multipartRequest, Review review) throws IOException, SQLException {
		multipartRequest.setCharacterEncoding("utf-8");
		Iterator<String> fileNames = multipartRequest.getFileNames();	
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			if(mFile.getOriginalFilename() != null && !mFile.getOriginalFilename().equals("")) {
				FileDTO dto = fileUpload.uploadFileToDirectoryUnderUploadPath(mFile, "review");
				save(new ReviewImages(review.getReviewId(), dto.getSavedPath() , review.getRestaurantId()));
			}
		}
	}
	
	public List<ReviewImages> findByReviewId(int reviewId) throws SQLException{
		ReviewImagesDAO dao = new ReviewImagesDAOImpl();
		List<ReviewImages> images = dao.select(reviewId);
		dao.close();

		return images;
	}
	
	public List<ReviewImages> findByRestaurantId(int restaurantId) throws SQLException{
		ReviewImagesDAO dao = new ReviewImagesDAOImpl();
		List<ReviewImages> images = dao.selectByRestaurantId(restaurantId);
		dao.close();
		
		return images;
	}

	public ReviewImages getThumbnail(int reviewId) throws SQLException{
		ReviewImagesDAO dao = new ReviewImagesDAOImpl();
		ReviewImages thumbnail = dao.selectLimit1(reviewId);
		dao.close();

		return thumbnail;
	}

	public int countByReviewId(int reviewId) throws SQLException{
		ReviewImagesDAO dao = new ReviewImagesDAOImpl();
		int cnt = dao.countByReviewId(reviewId);
		dao.close();

		return cnt;
	}
}
