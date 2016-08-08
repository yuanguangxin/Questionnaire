package com.service;


import com.mapper.ResultMapper;
import com.models.Result;
import com.models.ResultExample;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class ResultService {
    private ResultMapper resultMapper;

    public void setResultMapper(ResultMapper resultMapper) {
        this.resultMapper = resultMapper;
    }

    public ResultMapper getResultMapper() {
        return resultMapper;
    }

    public void addResult(Result result){
        resultMapper.insert(result);
    }

    public List<Result> getAllResults(){
        ResultExample resultExample = new ResultExample();
        ResultExample.Criteria criteria = resultExample.createCriteria();
        criteria.andSurveyIdIsNotNull().andStatusEqualTo(1);
        List<Result> list = resultMapper.selectByExample(resultExample);
        return list;
    }

    public Result getResultById(int id){
        return resultMapper.selectByPrimaryKey(id);
    }

    public List<Result> getResultByIds(int[] ids){
        List<Result> list = new ArrayList<>();
        for(int i=0;i<ids.length;i++){
            ResultExample resultExample = new ResultExample();
            ResultExample.Criteria criteria = resultExample.createCriteria();
            criteria.andUserIdEqualTo(ids[i]).andStatusEqualTo(1);
            List<Result> list1 = resultMapper.selectByExample(resultExample);
            if(list1.size()!=0) list.addAll(list1);
        }
        return list;
    }

    public List<Integer> getSurveyIds(int id){
        ResultExample resultExample = new ResultExample();
        ResultExample.Criteria criteria = resultExample.createCriteria();
        criteria.andUserIdEqualTo(id).andStatusEqualTo(1);
        List<Result> list = resultMapper.selectByExample(resultExample);
        List<Integer> list1 = new ArrayList<>();
        for (int i=0;i<list.size();i++){
            list1.add(list.get(i).getSurveyId());
        }
        return list1;
    }

    public Result checkStatus(int surveyId,int userId){
        ResultExample resultExample = new ResultExample();
        ResultExample.Criteria criteria = resultExample.createCriteria();
        criteria.andSurveyIdEqualTo(surveyId).andUserIdEqualTo(userId);
        List<Result> list = resultMapper.selectByExample(resultExample);
        if(list.size()==0) return null;
        else return list.get(0);
    }

    public void update(Result result){
        resultMapper.updateByPrimaryKeySelective(result);
    }
}
