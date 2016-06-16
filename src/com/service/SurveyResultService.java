package com.service;

import com.mapper.SurveyResultMapper;
import com.models.SurveyResult;
import com.models.SurveyResultExample;

import java.util.List;

public class SurveyResultService {
    private SurveyResultMapper surveyResultMapper;

    public SurveyResultMapper getSurveyResultMapper() {
        return surveyResultMapper;
    }

    public void setSurveyResultMapper(SurveyResultMapper surveyResultMapper) {
        this.surveyResultMapper = surveyResultMapper;
    }

    public void addResult(SurveyResult surveyResult){
        surveyResultMapper.insert(surveyResult);
    }

    public List<SurveyResult> getAllResults(){
        SurveyResultExample surveyResultExample = new SurveyResultExample();
        SurveyResultExample.Criteria criteria = surveyResultExample.createCriteria();
        criteria.andSurveyIdIsNotNull();
        List<SurveyResult> list = surveyResultMapper.selectByExample(surveyResultExample);
        return list;
    }
}
