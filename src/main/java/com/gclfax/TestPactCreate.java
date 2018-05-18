package com.gclfax;


import com.gclfax.common.utils.ReplaceAndToHtmlUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Create by ${user} on ${date}
 */
@RestController
public class TestPactCreate {

    @RequestMapping("/testPactCreate")
    public static void main(String[] args) {
        String sourceFile = "/alidata1/runtime/data_cg/data_pact/gxs_cg/baseTemp/90ea1418-952e-4444-8797-d2dfdfc10ee8.docx";
        String targetPath = "/alidata1/runtime/data_cg/data_pact/gxs_cg/baseTemp/";
        String targetFileName = "testPactCreate.pdf";

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("contractNo", "KKKKKKKK-002");
        params.put("firstParty", "中国人民解放军");
        params.put("firstPartyBusinessLicenseNumber", "00000000001");
        params.put("secondParty", "888");
        params.put("productName", "yyyyyyyyyyy");
        params.put("amount", "88888999.88");

        try {
            ReplaceAndToHtmlUtils.replaceAndToPdf(sourceFile,targetPath,targetFileName,params);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
