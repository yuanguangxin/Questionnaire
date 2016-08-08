package com.service;

import com.mapper.QuestionMapper;
import com.models.Question;
import com.models.QuestionExample;

import java.util.ArrayList;
import java.util.List;

public class QuestionService {
    private QuestionMapper questionMapper;

    public void setQuestionMapper(QuestionMapper questionMapper) {
        this.questionMapper = questionMapper;
    }

    public QuestionMapper getQuestionMapper() {
        return questionMapper;
    }

    public void addQuestion(Question question){
        questionMapper.insert(question);
    }

    public List<Question> getAllQuestion(){
        QuestionExample questionExample = new QuestionExample();
        QuestionExample.Criteria criteria = questionExample.createCriteria();
        criteria.andIdIsNotNull();
        List<Question> list = questionMapper.selectByExample(questionExample);
        return list;
    }

    public void deleteQuestion(int questionId){
        questionMapper.deleteByPrimaryKey(questionId);
    }

    public List<Question> getQuestionByIds(int[] ids){
        List<Question> list = new ArrayList<>();
        for(int i=0;i<ids.length;i++){
            Question questionBank = questionMapper.selectByPrimaryKey(ids[i]);
            list.add(questionBank);
        }
        return list;
    }

    public Question getQuestionById(int id){
        return questionMapper.selectByPrimaryKey(id);
    }

    public void sureUpdate(Question question){
        questionMapper.updateByPrimaryKeySelective(question);
    }
}
