package com.aj22.foodlab.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj22.foodlab.dao.comment.CommentDAO;
import com.aj22.foodlab.dao.comment.CommentDAOImpl;
import com.aj22.foodlab.domain.Comment;
import com.aj22.foodlab.dto.CommentDTO;

@Service
public class CommentService {
	
	@Autowired
	ReviewService reviewService;
	@Autowired
	MemberService memberService;
	
	public List<CommentDTO> findByReviewId(int reviewId) throws SQLException{
		CommentDAO dao = new CommentDAOImpl();
		List<Comment> comments= dao.selectByReviewId(reviewId);
		dao.close();
		
		return findAllAsDTO(comments);
	}
	
	public int insert(Comment comment) throws SQLException{
		CommentDAO dao = new CommentDAOImpl();
		int res = dao.insert(comment);
		dao.close();
		
		return res;
	}
	
	public List<CommentDTO> findAllAsDTO(List<Comment> commentEntities) throws SQLException{
		List<CommentDTO> comments = new ArrayList<>();
		
		for(Comment comment : commentEntities) {
			comments.add(convertToDTO(comment));
		}
		
		return comments;
	}
	
	public List<CommentDTO> findByParentId(int parentId) throws SQLException{
		CommentDAO dao = new CommentDAOImpl();
		List<Comment> comments= dao.selectByParentId(parentId);
		dao.close();
		
		return findAllAsDTO(comments);
	}
	
	public CommentDTO findByCommentId(int commentId) throws SQLException{
		CommentDAO dao = new CommentDAOImpl();
		Comment comment= dao.selectByCommentId(commentId);
		dao.close();
		
		return convertToDTO(comment);
	}
	
	public CommentDTO convertToDTO(Comment comment) throws SQLException {
		CommentDTO dto = new CommentDTO(comment);
		dto.setReview(reviewService.select(comment.getReviewId()));
		dto.setMember(memberService.selectById(comment.getMemberId()));
		dto.setCreatedAt(ReviewService.formatTimestampForDetail(comment.getCreatedAt()));
		dto.setUpdatedAt(ReviewService.formatTimestampForDetail(comment.getUpdatedAt()));
		
		return dto;
	}
}
