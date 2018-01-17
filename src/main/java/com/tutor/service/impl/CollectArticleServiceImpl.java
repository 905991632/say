package com.tutor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tutor.dao.CollectarticleMapper;
import com.tutor.entity.Collectarticle;
import com.tutor.entity.CollectarticleExample;
import com.tutor.entity.CollectarticleExample.Criteria;
import com.tutor.service.CollectArticleService;

/*
 * 	论坛文章收藏模块
 */
@Service
public class CollectArticleServiceImpl implements CollectArticleService {

	@Autowired
	CollectarticleMapper collectarticleMapper;
	
	/*
	 * 添加实体类
	 * 返回1
	 */
	@Override
	public int addCollectArticle(Collectarticle collectarticle) {
		return collectarticleMapper.insertSelective(collectarticle);
	}

	/*
	 * 删除实体类
	 * 返回1
	 */
	@Override
	public int deleteCollectArticle(int id) {
		return collectarticleMapper.deleteByPrimaryKey(id);
	}
	
	/*
	 * 更新实体类
	 * 返回1
	 */
	@Override
	public int updateByPrimaryKeySelective(Collectarticle collectarticle) {
		return collectarticleMapper.updateByPrimaryKeySelective(collectarticle);
	}

	/*
	 * 通过id查询实体类
	 * 返回实体类
	 */
	@Override
	public Collectarticle selectByPrimaryKey(int id) {
		return collectarticleMapper.selectByPrimaryKey(id);
	}
	
	/*
	 * 筛选实体类
	 * 返回实体类列表
	 */
	@Override
	public List<Collectarticle> getCollectarticlesByCondition(Collectarticle collectarticle) {
		CollectarticleExample example = new CollectarticleExample();
		Criteria criteria = example.createCriteria();
		if(collectarticle.getUserid()!=null){
			criteria.andUseridEqualTo(collectarticle.getUserid());
		}
		if(collectarticle.getArticleid()!=null){
			criteria.andArticleidEqualTo(collectarticle.getArticleid());
		}
		example.setOrderByClause("createTime desc");
		return collectarticleMapper.selectByExample(example);
	}

	
}
