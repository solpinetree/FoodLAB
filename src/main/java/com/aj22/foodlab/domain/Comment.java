package com.aj22.foodlab.domain;

import java.sql.Timestamp;

import com.aj22.foodlab.dto.MemberDTO;
import com.aj22.foodlab.dto.ReviewDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Comment {
	private Integer commentId;
	private Integer reviewId;
	private Integer memberId;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String content;
	private Integer parentCommentId;
	
}
