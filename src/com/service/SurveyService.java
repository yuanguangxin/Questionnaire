package com.service;

import com.mapper.SurveyMapper;
import com.models.Survey;
import com.models.SurveyExample;

public class SurveyService {
    private SurveyMapper surveyMapper;

    public SurveyMapper getSurveyMapper() {
        return surveyMapper;
    }

    public void setSurveyMapper(SurveyMapper surveyMapper) {
        this.surveyMapper = surveyMapper;
    }

    public void createSurvey(Survey survey){
        SurveyExample surveyExample = new SurveyExample();
        SurveyExample.Criteria criteria = surveyExample.createCriteria();
        criteria.andIdIsNotNull();
        surveyMapper.deleteByExample(surveyExample);
        surveyMapper.insert(survey);
    }

    public Survey getSurvey(){
        SurveyExample surveyExample = new SurveyExample();
        SurveyExample.Criteria criteria = surveyExample.createCriteria();
        criteria.andIdIsNotNull();
        return surveyMapper.selectByExample(surveyExample).get(0);
    }
}
