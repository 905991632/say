package com.tutor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tutor.dao.CommentMapper;
import com.tutor.entity.Comment;
import com.tutor.entity.CommentExample;
import com.tutor.entity.CommentExample.Criteria;
import com.tutor.service.CommentService;

/*
 * 	文章评论模块
 */
@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;
	/*
	 * 添加实体类
	 * 返回1
	 */
	@Override
	public int addComment(Comment comment) {
		return commentMapper.insertSelective(comment);
	}

	/*
	 * 删除实体类
	 * 返回1
	 */
	@Override
	public int deleteComment(int id) {
		return commentMapper.deleteByPrimaryKey(id);
	}
	
	/*
	 * 更新实体类
	 * 返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Comment comment) {
		return commentMapper.updateByPrimaryKeySelective(comment);
	}

	/*
	 * 通过id查询实体类
	 * 返回实体类
	 */
	@Override
	public Comment selectByPrimaryKey(int id) {
		return commentMapper.selectByPrimaryKey(id);
	}

	/*
	 * 筛选实体类
	 * 返回实体类列表
	 */
	@Override
	public List<Comment> getCommentsByCondition(Comment comment) {
		CommentExample example = new CommentExample();
		Criteria criteria = example.createCriteria();
		if(comment.getUserid()!=null){
			criteria.andUseridEqualTo(comment.getUserid());
		}
		if(comment.getArticleid()!=null){
			criteria.andArticleidEqualTo(comment.getArticleid());
		}
		if(comment.getContent()!=null){
			criteria.andContentEqualTo(comment.getContent());
		}
		example.setOrderByClause("createTime desc");
		return commentMapper.selectByExample(example);
	}
	

}
