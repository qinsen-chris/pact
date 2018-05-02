package com.gclfax.modules.pact.controller;

import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.service.PactRecordService;
import com.gclfax.modules.pact.service.PactTemplateService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 协议生成
 * Created by chenmy on 2018/4/27.
 */
@RestController
@RequestMapping("/pact")
public class PactController {

    @Autowired
    private PactTemplateService pactTemplateService;
    @Autowired
    private PactRecordService pactRecordService;

    /**
     * 查询模板
     * @param
     * @return
     */
    @RequestMapping(value = "/pactTemp",method = RequestMethod.GET)
    public R pactTemp(@RequestParam String platform){
        Map<String,Object> paramMap = new HashedMap();
        paramMap.put("platform",platform);
        List<Map<String,Object>> tempList = pactTemplateService.queryPactTemplate(paramMap);
        return R.ok().put("data",tempList);
    }

    /**
     * 查文件路径
     * @param platfrom
     * @param pactFlag
     * @param pactFlagId
     * @return
     */
    @RequestMapping(value = "/pactPath",method = RequestMethod.POST)
    public R pactPath(String platfrom,String pactFlag,Long pactFlagId){
        Map<String,Object> map = pactRecordService.queryPactPath(platfrom,pactFlag,pactFlagId);
        return R.ok().put("data",map);
    }

    /**
     * 查文件路径
     * @param platfrom
     * @param pactFlag
     * @param pactFlagId
     * @return
     */
    @RequestMapping(value = "/pactGenerate",method = RequestMethod.POST)
    public R pactGenerate(String platfrom,String fileDate,String pactFlag,Long pactFlagId,Long pactVersionId){
        pactRecordService.pactRecordService(platfrom,fileDate,pactFlag,pactFlagId,pactVersionId);
        return R.ok().put("data","");
    }

}
