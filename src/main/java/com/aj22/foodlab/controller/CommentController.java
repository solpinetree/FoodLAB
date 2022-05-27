package com.aj22.foodlab.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj22.foodlab.domain.Comment;
import com.aj22.foodlab.dto.CommentDTO;
import com.aj22.foodlab.service.CommentService;

@Controller
@RequestMapping("/comments")
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@PostMapping("/insert")
	@ResponseBody
	public String insertComment(Comment comment) throws SQLException {
		Integer commentId = commentService.insert(comment);
		
		
		if(commentId != null) {
			System.out.println("댓글 등록 성공");
		}
		
		return null;
	}
	
	
	private String html = "";
	
	@RequestMapping(value="/list", produces="application/text;charset=utf8")
	@ResponseBody
	public String getComments(@RequestParam int reviewId) throws SQLException {
		html="";
		List<CommentDTO> comments =  commentService.findByReviewId(reviewId);
		for (CommentDTO dto : comments) {
            if (dto.getParentCommentId() == null) {
                html += 
		                "<div class='listing__details__comment__item'>" 
		              + 	"<div class='listing__details__comment__item__pic'>"
		      	      + 		"<img src='/foodlab/resources/img/defaultProfile.jpeg'>"
		              +		"</div>"
		      	      +		"<div class='listing__details__comment__item__text'>"
		              +			"<span>"+dto.getCreatedAt()+"</span>"
		              +			"<h5>"+dto.getMember().getUsername()+"</h5>"
		              + 		"<p>"+dto.getContent()+"</p>"
		              + 		"<button type='button' class='reply-btn' id="+ dto.getCommentId() + ">"
		              +				"<i class='fa fa-reply'></i> 대댓글 달기"
		              +			"</button>"
		              +		"</div>"
		              +	"</div>";
      	
                parser(dto.getCommentId(), 0, true);
            }
        }
		
		return html;
	}
	
	/*
    Recursive to construct html code
     */
    public void parser(int parentId, int level, boolean root) throws SQLException {

        if (!root) {
        	CommentDTO comment = commentService.findByCommentId(parentId);
        	
        	
        	
            html += 
	                "<div class='listing__details__comment__item' style='margin-left:"+ level*48 + "px'>" 
	              + 	"<div class='listing__details__comment__item__pic'>"
	      	      + 		"<img src='/foodlab/resources/img/defaultProfile.jpeg'>"
	              +		"</div>"
	      	      +		"<div class='listing__details__comment__item__text'>"
	              +			"<span>"+comment.getCreatedAt()+"</span>"
	              +			"<h5>"+comment.getMember().getUsername()+"</h5>"
	              + 		"<p>"+comment.getContent()+"</p>"
	              + 		"<button type='button' class='reply-btn' id="+ comment.getCommentId() + ">"
	              +				"<i class='fa fa-reply'></i> 대댓글 달기"
	              +			"</button>"
	              +		"</div>"
	              +	"</div>";

        }

        List<CommentDTO> comments = commentService.findByParentId(parentId);
        if (!comments.isEmpty()) {
            for (CommentDTO comment : comments) {
                parser(comment.getCommentId(), level+1, false);
            }
        }
    }
	
}
