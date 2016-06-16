package com.controller;

import com.models.QuestionBank;
import com.models.Survey;
import com.service.QuestionBankService;
import com.service.SurveyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class SurveyController {
    private SurveyService surveyService;
    private QuestionBankService questionBankService;

    public void setQuestionBankService(QuestionBankService questionBankService) {
        this.questionBankService = questionBankService;
    }

    public QuestionBankService getQuestionBankService() {
        return questionBankService;
    }

    public void setSurveyService(SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    public SurveyService getSurveyService() {
        return surveyService;
    }

    @RequestMapping("/createSurvey")
    public void createSurvey(Survey survey, HttpServletResponse response){
        survey.setStatus(1);
        System.out.println(survey.getQuestionId());
        surveyService.createSurvey(survey);
    }

    @RequestMapping("/getSurveyBySex")
    public void getSurveyBySex(@RequestParam(value = "sex") String sex, HttpServletRequest request){
        Survey survey = surveyService.getSurvey();
        String[] ids = survey.getQuestionId().split(",");
        int[] questionIds = new int[ids.length];
        for(int i=0;i<ids.length;i++){
            questionIds[i] = Integer.parseInt(ids[i]);
        }
        List<QuestionBank> list = questionBankService.getQuestionByIds(questionIds);
        request.setAttribute("questions",list);
        request.setAttribute("sex",sex);
    }
}
