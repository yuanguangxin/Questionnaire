package com.controller;

import com.models.SurveyResult;
import com.service.SurveyResultService;
import com.service.SurveyService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SurveyResultController {
    private SurveyResultService surveyResultService;
    private SurveyService surveyService;

    public void setSurveyService(SurveyService surveyService) {
        this.surveyService = surveyService;
    }

    public SurveyService getSurveyService() {
        return surveyService;
    }

    public void setSurveyResultService(SurveyResultService surveyResultService) {
        this.surveyResultService = surveyResultService;
    }

    public SurveyResultService getSurveyResultService() {
        return surveyResultService;
    }

    @RequestMapping("/addAnswer")
    public void addAnswer(SurveyResult surveyResult, HttpServletResponse response){
        surveyResult.setSurveyId(0);
        surveyResultService.addResult(surveyResult);
    }

    @RequestMapping("/getAllResult")
    public String getAllResult(HttpServletRequest request){
        List<SurveyResult> list = surveyResultService.getAllResults();
        List<String[]> s = new ArrayList<>();
        for(int i=0;i<list.size();i++){
            String result = list.get(i).getAnswer();
            String[] ss = new String[result.split(";").length];
            for(int j=0;j<result.split(";").length;j++){
                ss[j] = result.split(";")[j];
            }
            s.add(ss);
        }
        request.setAttribute("results",list);
        request.setAttribute("answerString",s);
        return "print_survey.jsp";
    }

    @RequestMapping("/printSurvey")
    public void printSurvey(HttpServletResponse response) throws Exception{
        System.out.println("aaaaaaa");
        List<SurveyResult> list = surveyResultService.getAllResults();
        List<String[]> s = new ArrayList<>();
        for(int i=0;i<list.size();i++){
            String result = list.get(i).getAnswer();
            String[] ss = new String[result.split(";").length];
            for(int j=0;j<result.split(";").length;j++){
                ss[j] = result.split(";")[j];
            }
            s.add(ss);
        }
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet=wb.createSheet("Survey Report");
        //在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
        HSSFRow row1=sheet.createRow(0);
        //创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
        HSSFCell cell=row1.createCell(0);
        //设置单元格内容
        cell.setCellValue("性别/(索引,答案)");
        //合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));

        for(int i=0;i<list.size();i++){
            HSSFRow row=sheet.createRow(i+1);
            if(list.get(i).getSex()==1){
                row.createCell(0).setCellValue("男");
            }else {
                row.createCell(0).setCellValue("女");
            }
            for(int j=0;j<s.size();j++){
                if(i==j){
                    for(int k=0;k<s.get(j).length;k++){
                        row.createCell(k+1).setCellValue(s.get(j)[k]);
                    }
                }
            }
        }

        OutputStream output=response.getOutputStream();
        response.reset();
        response.setHeader("Content-disposition", "attachment; filename=Survey Report.xls");
        response.setContentType("application/msexcel");
        wb.write(output);
        output.close();
    }
}
