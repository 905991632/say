package com.tutor.service;

import java.util.List;

import com.tutor.entity.Comment;

public interface CommentService {

	int addComment(Comment comment);
	
	int deleteComment(int id);
	
	int updateByPrimaryKeySelective(Comment comment);
	
	Comment selectByPrimaryKey(int id);
	
	List<Comment> getCommentsByCondition(Comment comment);
}
