package com.mapper;

import com.models.SurveyResult;
import com.models.SurveyResultExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SurveyResultMapper {
    int countByExample(SurveyResultExample example);

    int deleteByExample(SurveyResultExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SurveyResult record);

    int insertSelective(SurveyResult record);

    List<SurveyResult> selectByExample(SurveyResultExample example);

    SurveyResult selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SurveyResult record, @Param("example") SurveyResultExample example);

    int updateByExample(@Param("record") SurveyResult record, @Param("example") SurveyResultExample example);

    int updateByPrimaryKeySelective(SurveyResult record);

    int updateByPrimaryKey(SurveyResult record);
}