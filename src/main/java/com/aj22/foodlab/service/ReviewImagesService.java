package com.aj22.foodlab.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aj22.foodlab.dao.reviewImages.ReviewImagesDAO;
import com.aj22.foodlab.dao.reviewImages.ReviewImagesDAOImpl;
import com.aj22.foodlab.domain.ReviewImages;
import com.aj22.foodlab.dto.FileDTO;
import com.aj22.foodlab.util.FileUpload;

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
	
	public void saveReviewImages(MultipartHttpServletRequest multipartRequest, int reviewId) throws IOException, SQLException {
		multipartRequest.setCharacterEncoding("utf-8");
		Iterator<String> fileNames = multipartRequest.getFileNames();	
		
        while(fileNames.hasNext()) {
            String fileName = fileNames.next();
        	MultipartFile mFile = multipartRequest.getFile(fileName);
        	FileDTO dto = fileUpload.uploadFileToDirectoryUnderUploadPath(mFile, "review");
        	if(dto.getOriginName() != null && !dto.getOriginName().equals("")) {
        		save(new ReviewImages(reviewId, dto.getSavedName()));
        	}
        }
	}
	
	public List<ReviewImages> findByReviewId(int reviewId) throws SQLException{
		ReviewImagesDAO dao = new ReviewImagesDAOImpl();
		List<ReviewImages> images = dao.select(reviewId);
		dao.close();
		
		
		return images;
	}
}
