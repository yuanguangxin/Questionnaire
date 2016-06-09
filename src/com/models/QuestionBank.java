package com.models;

public class QuestionBank {
    private Integer id;

    private Integer type;

    private Integer sex;

    private String questionFormat;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getQuestionFormat() {
        return questionFormat;
    }

    public void setQuestionFormat(String questionFormat) {
        this.questionFormat = questionFormat == null ? null : questionFormat.trim();
    }
}