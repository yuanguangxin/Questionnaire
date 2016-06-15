package com.controller;

import com.models.QuestionBank;
import com.service.QuestionBankService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class QuestionBankController {
    private QuestionBankService questionBankService;

    public QuestionBankService getQuestionBankService() {
        return questionBankService;
    }

    public void setQuestionBankService(QuestionBankService questionBankService) {
        this.questionBankService = questionBankService;
    }
    @RequestMapping("/addQuestion")
    public String addQuestion(QuestionBank questionBank){
        questionBank.setType(0);
        System.out.println(questionBank.getQuestionFormat());
        questionBankService.addQuestion(questionBank);
        return "/add_question.html";
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
        request.setAttribute("allQuestions",list);
        return "/create_questionnaire.jsp";
    }
}
