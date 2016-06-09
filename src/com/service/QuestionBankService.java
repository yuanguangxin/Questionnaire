package com.service;

import com.mapper.QuestionBankMapper;

public class QuestionBankService {
    private QuestionBankMapper questionBankMapper;

    public QuestionBankMapper getQuestionBankMapper() {
        return questionBankMapper;
    }

    public void setQuestionBankMapper(QuestionBankMapper questionBankMapper) {
        this.questionBankMapper = questionBankMapper;
    }
}
