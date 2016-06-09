package com.service;

import com.mapper.SurveyMapper;

public class SurveyService {
    private SurveyMapper surveyMapper;

    public SurveyMapper getSurveyMapper() {
        return surveyMapper;
    }

    public void setSurveyMapper(SurveyMapper surveyMapper) {
        this.surveyMapper = surveyMapper;
    }
}
