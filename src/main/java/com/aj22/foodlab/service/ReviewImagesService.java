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
//	@Autowired
//	S3FileUploadService s3Service;

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
			FileDTO dto = fileUpload.uploadFileToDirectoryUnderUploadPath(mFile, "review");
			if(dto.getOriginName() != null && !dto.getOriginName().equals("")) {
//				save(new ReviewImages(review.getReviewId(), s3Service.upload(mFile, "review"), review.getRestaurantId()));
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
}
