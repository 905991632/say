package com.tutor.dao;

import com.tutor.entity.TutorLive;
import com.tutor.entity.TutorLiveExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TutorLiveMapper {
    long countByExample(TutorLiveExample example);

    int deleteByExample(TutorLiveExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TutorLive record);

    int insertSelective(TutorLive record);

    List<TutorLive> selectByExample(TutorLiveExample example);

    TutorLive selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TutorLive record, @Param("example") TutorLiveExample example);

    int updateByExample(@Param("record") TutorLive record, @Param("example") TutorLiveExample example);

    int updateByPrimaryKeySelective(TutorLive record);

    int updateByPrimaryKey(TutorLive record);
}