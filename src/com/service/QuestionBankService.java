package com.service;

import com.mapper.QuestionBankMapper;
import com.models.QuestionBank;
import com.models.QuestionBankExample;

import java.util.ArrayList;
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

    public void deleteQuestion(int questionId){
        questionBankMapper.deleteByPrimaryKey(questionId);
    }

    public List<QuestionBank> getQuestionByIds(int[] ids){
        List<QuestionBank> list = new ArrayList<>();
        for(int i=0;i<ids.length;i++){
            QuestionBank questionBank = questionBankMapper.selectByPrimaryKey(ids[i]);
            list.add(questionBank);
        }
        return list;
    }
}
