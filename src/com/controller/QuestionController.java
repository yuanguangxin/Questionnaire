package com.controller;


import com.models.Question;
import com.models.Survey;
import com.service.QuestionService;
import com.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private SurveyService surveyService;

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    public QuestionService getQuestionService() {
        return questionService;
    }

    public void setSurveyService(SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    public SurveyService getSurveyService() {
        return surveyService;
    }


    @RequestMapping("/addQuestion")
    public String addQuestion(Question question){
        questionService.addQuestion(question);
        return "/add_question.jsp";
    }

    @RequestMapping("/questionManage")
    public String questionManage(HttpServletRequest request){
        List<Question> list = questionService.getAllQuestion();
        request.setAttribute("allQuestions",list);
        return "/question_manage.jsp";
    }

    @RequestMapping("/createQuestionnaire")
    public String createQuestionnaire(@RequestParam("id")String id, HttpServletRequest request){
        List<Question> list = questionService.getAllQuestion();
        Survey survey = surveyService.getSurvey(Integer.parseInt(id));
        request.setAttribute("allQuestions",list);
        request.setAttribute("survey",survey);
        return "/create_questionnaire.jsp";
    }

    @RequestMapping("/deleteQuestion")
    public void deleteQuestion(@RequestParam("questionId") String questionId,
                               HttpServletResponse response){
        questionService.deleteQuestion(Integer.parseInt(questionId));
    }

    @RequestMapping("/updateQuestion")
    public String updateQuestion(@RequestParam("ids") String ids,
                                 HttpServletRequest request){
        Question question = questionService.getQuestionById(Integer.parseInt(ids));
        request.setAttribute("question",question);
        return "update_question.jsp";
    }

    @RequestMapping("sureUpdate")
    public String sureUpdate(Question question){
        questionService.sureUpdate(question);
        return "admin.jsp";
    }
}
