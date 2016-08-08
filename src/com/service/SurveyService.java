package com.service;

import com.mapper.SurveyMapper;
import com.models.Survey;
import com.models.SurveyExample;
import org.omg.CORBA.PUBLIC_MEMBER;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class SurveyService {
    private SurveyMapper surveyMapper;

    public SurveyMapper getSurveyMapper() {
        return surveyMapper;
    }

    public void setSurveyMapper(SurveyMapper surveyMapper) {
        this.surveyMapper = surveyMapper;
    }

    public void createSurvey(Survey survey){
        surveyMapper.updateByPrimaryKeySelective(survey);
    }

    public Survey getSurvey(int id){
        return surveyMapper.selectByPrimaryKey(id);
    }

    public List<Survey> getAllSurvey(){
        SurveyExample surveyExample = new SurveyExample();
        SurveyExample.Criteria criteria = surveyExample.createCriteria();
        criteria.andIdIsNotNull();
        List<Survey> list = surveyMapper.selectByExample(surveyExample);
        return list;
    }

    public void addSurvey(Survey survey){
        surveyMapper.insert(survey);
    }

    public void deleteSurvey(int id){
        surveyMapper.deleteByPrimaryKey(id);
    }

    public List<Survey> getUserSurvey(List<Integer> sid){
        List<Survey> list = getAllSurvey();
        for (int j=0;j<sid.size();j++){
            for (int k=0;k<list.size();k++){
                if(list.get(k).getId()==sid.get(j)){
                    list.remove(k);
                    break;
                }
            }
        }
        return list;
    }
}
