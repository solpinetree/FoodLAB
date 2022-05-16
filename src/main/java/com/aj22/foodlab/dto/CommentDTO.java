package com.aj22.foodlab.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommentDTO {
	private int commentId;
	private int reviewId;
	private int writerId;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String content;
	private int parentCommentId;
}
