package com.controller;

import com.models.Question;
import com.models.Survey;
import com.models.User;
import com.service.QuestionService;
import com.service.ResultService;
import com.service.SurveyService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SurveyController {
    @Autowired
    private SurveyService surveyService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private ResultService resultService;

    public void setResultService(ResultService resultService) {
        this.resultService = resultService;
    }

    public ResultService getResultService() {
        return resultService;
    }

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
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
        surveyService.createSurvey(survey);
    }

    @RequestMapping("/saveSurvey")
    public void saveSurvey(Survey survey, HttpServletResponse response){
        surveyService.createSurvey(survey);
    }

    @RequestMapping("/selectSurvey")
    public String selectSurvey(HttpServletRequest request){
        List<Survey> list = surveyService.getAllSurvey();
        request.setAttribute("surveys",list);
        return "select_survey.jsp";
    }

    @RequestMapping("/getUserSurvey")
    public String getUserSurvey(HttpServletRequest request, HttpSession session){
        User user = (User)session.getAttribute("user");
        int id = user.getId();
        List<Survey> list = surveyService.getUserSurvey(resultService.getSurveyIds(id));
        request.setAttribute("surveys",list);
        return "user_select.jsp";
    }

    @RequestMapping("/getSurveyBySex")
    public String getSurveyBySex(@RequestParam(value = "sex") String sex,
                                 @RequestParam("sid")String sid,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        Survey survey = surveyService.getSurvey(Integer.parseInt(sid));
        String[] ids = survey.getQuestionId().split(",");
        int[] questionIds = new int[ids.length];
        for(int i=0;i<ids.length;i++){
            questionIds[i] = Integer.parseInt(ids[i]);
        }
        List<Question> list = questionService.getQuestionByIds(questionIds);
        request.setAttribute("allQuestions",list);
        request.setAttribute("sex",sex);
        request.setAttribute("sid",sid);
        return "answer_questions.jsp";
    }

    @RequestMapping("addSurvey")
    public String addSurvey(Survey survey){
        survey.setStatus(0);
        survey.setQuestionId("");
        surveyService.addSurvey(survey);
        return "/selectSurvey.action";
    }

    @RequestMapping("deleteSurvey")
    public void deleteSurvey(@RequestParam("id") String id, HttpServletResponse response){
        surveyService.deleteSurvey(Integer.parseInt(id));
    }
}
