package com.gclfax.common.utils;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * Create by ${user} on ${date}
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ReplaceAndToHtmlUtilsTest {
    @Test
    public void replaceWordByParam() throws Exception {
    }

    @Test
    public void replaceAndToHtml() throws Exception {
    }

    @Test
    public void replaceAndToPdf() throws Exception {
        String filePath = "D:\\project-gxs\\需求\\work导入1053\\模板\\04买入转售\\买入返售-代发标模板.docx";
        String targetPath = "D:\\project-gxs\\需求\\work导入1053\\模板\\04买入转售\\";
        String targetFileName = "买入返售-代发标模板.pdf";

        Map<String, Object> params = getStringObjectMap();

        ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targetPath,targetFileName,params);
    }

    @Test
    public void replaceAndToPdfByOneThread() throws Exception {
        String filePath = "D:\\project-gxs\\需求\\work导入1053\\模板\\04买入转售\\买入返售-代发标模板.docx";
        String targetPath = "D:\\project-gxs\\需求\\work导入1053\\模板\\04买入转售\\";
        //String targetFileName = "买入返售-代发标模板.pdf";

        Map<String, Object> params = getStringObjectMap();

        String targetFileName = "买入返售-代发标模板";
        int pdfNum = 50 ;
        long startTime = new Date().getTime();
        for (int i=0;i<pdfNum;i++){
            String newFileName = "";
            newFileName = targetFileName+i+".pdf";
            ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targetPath,newFileName,params);
        }
        long endTime = new Date().getTime();
        System.out.println("生成pdf文件共消耗时间为："+(endTime - startTime) +"毫秒");

    }

    private Map<String, Object> getStringObjectMap() {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("contractNo", "GXS-001-X001");
        params.put("firstParty", "中国人民解放军");
        params.put("firstPartyIDNumber", "37082619850113");
        params.put("firstPartyBusinessLicenseNumber", "100000000001");
        params.put("secondParty", "上海第五军区");
        params.put("secondPartyIDNumber", "2222222233333333");
        params.put("secondPartyUserName", "国鑫所用户名22");
        params.put("period", "66");
        params.put("periodUnit", "天");
        params.put("productName", "鑫安赢001号");
        params.put("interestStartDay", "2018-05-15");
        params.put("interestEndDay", "2018-09-15");
        params.put("amount", "2500000");
        params.put("apr", "8.18");
        params.put("manageFee", "1.2");
        params.put("extendPeriod", "2");
        params.put("serviceApr", "1.3");
        params.put("debtManageCompany", "测试测试");
        params.put("pledgeType", "测试测试2");
        params.put("capitalInterestSum", "889");
        params.put("repaymentName", "测试测试2");
        params.put("repaymentTime", "2018-06-09");
        params.put("debtAmount", "99.99");
        params.put("debtPeriod", "99");

        params.put("factoringCompany", "丙方受让方");
        params.put("factoringCompanyLicense", "99999999");

        params.put("contractMode", "不知道奥");
        params.put("signDate", "2018-05-16");
        //定向融资工具
        params.put("feBidNumber", "s111111");
        params.put("feBidPeriod", "s222222");
        params.put("fePublisher", "s333333");
        params.put("feLegalRepresentative", "s444444");

        //东北亚
        params.put("productNo", "s444444");
        params.put("feProductSeria", "s55555");
        params.put("seqNo", "s444444");
        params.put("fePublisher", "の555555");
        params.put("recordDate", "20180506");
        params.put("gdsAccountId", "1234567898");
        params.put("feExpectApr", "8.88");
        params.put("feCreditOrgan", "8.11");
        params.put("fePrincipal", "8.22");

        //债权转让及受让合同
        params.put("firstPartyUserName", "firstPartyUserNamesss");
        return params;
    }

    class  MyThread extends Thread{

        @Override
        public void run(){

        }
    }

    @Test
    public void wordToHtml() throws Exception {
    }

    @Test
    public void writeFile() throws Exception {
    }

}