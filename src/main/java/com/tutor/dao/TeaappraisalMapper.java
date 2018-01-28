package com.tutor.dao;

import com.tutor.entity.Teaappraisal;
import com.tutor.entity.TeaappraisalExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeaappraisalMapper {
    long countByExample(TeaappraisalExample example);

    int deleteByExample(TeaappraisalExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Teaappraisal record);

    int insertSelective(Teaappraisal record);

    List<Teaappraisal> selectByExample(TeaappraisalExample example);

    Teaappraisal selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Teaappraisal record, @Param("example") TeaappraisalExample example);

    int updateByExample(@Param("record") Teaappraisal record, @Param("example") TeaappraisalExample example);

    int updateByPrimaryKeySelective(Teaappraisal record);

    int updateByPrimaryKey(Teaappraisal record);
}