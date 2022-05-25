package com.aj22.foodlab.dto;


import com.aj22.foodlab.domain.Comment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommentDTO {
	private Integer commentId;
	private ReviewDTO review;
	private MemberDTO member;
	private String createdAt;
	private String updatedAt;
	private String content;
	private Integer parentCommentId;
	
	public CommentDTO(Comment comment) {
		this.commentId = comment.getCommentId();
		this.review = null;
		this.member = null;
		this.content = comment.getContent();
		this.createdAt = null;
		this.parentCommentId = comment.getParentCommentId();
		
	}
}
