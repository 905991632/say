package com.tutor.dao;

import com.tutor.entity.Collectarticle;
import com.tutor.entity.CollectarticleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectarticleMapper {
    long countByExample(CollectarticleExample example);

    int deleteByExample(CollectarticleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Collectarticle record);

    int insertSelective(Collectarticle record);

    List<Collectarticle> selectByExample(CollectarticleExample example);

    Collectarticle selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Collectarticle record, @Param("example") CollectarticleExample example);

    int updateByExample(@Param("record") Collectarticle record, @Param("example") CollectarticleExample example);

    int updateByPrimaryKeySelective(Collectarticle record);

    int updateByPrimaryKey(Collectarticle record);
}