package com.tutor.dao;

import com.tutor.entity.Stuappraisal;
import com.tutor.entity.StuappraisalExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StuappraisalMapper {
    long countByExample(StuappraisalExample example);

    int deleteByExample(StuappraisalExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Stuappraisal record);

    int insertSelective(Stuappraisal record);

    List<Stuappraisal> selectByExample(StuappraisalExample example);

    Stuappraisal selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Stuappraisal record, @Param("example") StuappraisalExample example);

    int updateByExample(@Param("record") Stuappraisal record, @Param("example") StuappraisalExample example);

    int updateByPrimaryKeySelective(Stuappraisal record);

    int updateByPrimaryKey(Stuappraisal record);
}