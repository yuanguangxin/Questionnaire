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
public class QuestionBankController {
    private QuestionBankService questionBankService;

    public QuestionBankService getQuestionBankService() {
        return questionBankService;
    }

    public SurveyService surveyService;

    public void setSurveyService(SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    public SurveyService getSurveyService() {
        return surveyService;
    }

    public void setQuestionBankService(QuestionBankService questionBankService) {
        this.questionBankService = questionBankService;
    }
    @RequestMapping("/addQuestion")
    public String addQuestion(QuestionBank questionBank){
        questionBank.setType(0);
        questionBankService.addQuestion(questionBank);
        return "/add_question.jsp";
    }

    @RequestMapping("/questionManage")
    public String questionManage(HttpServletRequest request){
        List<QuestionBank> list = questionBankService.getAllQuestion();
        request.setAttribute("allQuestions",list);
        return "/question_manage.jsp";
    }

    @RequestMapping("/createQuestionnaire")
    public String createQuestionnaire(HttpServletRequest request){
        List<QuestionBank> list = questionBankService.getAllQuestion();
        Survey survey = surveyService.getSurvey();
        request.setAttribute("allQuestions",list);
        request.setAttribute("survey",survey);
        return "/create_questionnaire.jsp";
    }

    @RequestMapping("/deleteQuestion")
    public void deleteQuestion(@RequestParam(value = "questionId") String questionId,
                               HttpServletResponse response){
        questionBankService.deleteQuestion(Integer.parseInt(questionId));
    }

}
