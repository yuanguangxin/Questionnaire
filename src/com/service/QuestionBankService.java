package com.service;

import com.mapper.QuestionBankMapper;
import com.models.QuestionBank;
import com.models.QuestionBankExample;

import java.util.List;

public class QuestionBankService {
    private QuestionBankMapper questionBankMapper;

    public QuestionBankMapper getQuestionBankMapper() {
        return questionBankMapper;
    }

    public void setQuestionBankMapper(QuestionBankMapper questionBankMapper) {
        this.questionBankMapper = questionBankMapper;
    }

    public void addQuestion(QuestionBank questionBank){
        questionBankMapper.insert(questionBank);
    }

    public List<QuestionBank> getAllQuestion(){
        QuestionBankExample questionBankExample = new QuestionBankExample();
        QuestionBankExample.Criteria criteria = questionBankExample.createCriteria();
        criteria.andIdIsNotNull();
        List<QuestionBank> list = questionBankMapper.selectByExample(questionBankExample);
        return list;
    }
}
