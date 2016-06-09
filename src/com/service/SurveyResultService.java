package com.service;

import com.mapper.SurveyResultMapper;

public class SurveyResultService {
    private SurveyResultMapper surveyResultMapper;

    public SurveyResultMapper getSurveyResultMapper() {
        return surveyResultMapper;
    }

    public void setSurveyResultMapper(SurveyResultMapper surveyResultMapper) {
        this.surveyResultMapper = surveyResultMapper;
    }
}
