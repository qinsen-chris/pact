package com.gclfax.modules.pact.controller;

import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactRecordEntity;
import com.gclfax.modules.pact.service.PactRecordService;
import com.gclfax.modules.pact.service.PactTemplateService;
import com.gclfax.modules.pact.vo.PactRequestVo;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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
     * 查询模板列表
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
     * @param requestVo
     * @return
     */
    @RequestMapping(value = "/pactPath",method = RequestMethod.POST)
    public  @ResponseBody R pactPath(@RequestBody PactRequestVo requestVo){
        PactRecordEntity query = new PactRecordEntity();
        query.setPlatform(requestVo.getPlatform());
        query.setPactFlag(requestVo.getPactFlag());
        query.setPactFlagId(requestVo.getBusinessId());
        Map<String,Object> map = pactRecordService.queryPactPath(query);

        Map<String,Object> resultMap = new HashMap<String,Object>();
        if(map == null || StringUtils.isEmpty(map.get("pactPath"))){
            resultMap.put("isExist",0);
        }else{
            resultMap.put("isExist",1);
            resultMap.put("pactPath",map.get("pactPath"));
        }
        return R.ok().put("data",resultMap);
    }

    /**
     * 生成合同
     * @param requestVo
     * @return
     */
    @RequestMapping(value = "/pactGenerate",method = RequestMethod.POST)
    public @ResponseBody R pactGenerate(@RequestBody PactRequestVo requestVo){
        Map<String,Object> map = pactRecordService.pactRecordService(requestVo.getPlatform(),requestVo.getFileDate(),requestVo.getPactFlag(),requestVo.getBusinessId(),requestVo.getPactVersionId());
        if(!(boolean)map.get("result")){
            return R.error((String) map.get("msg"));
        }
        return R.ok().put("data",map);
    }

    /**
     * 生成转让标合同
     * @param requestVo
     * @return
     */
    @RequestMapping(value = "/pactGenerateO2M",method = RequestMethod.POST)
    public @ResponseBody R pactGenerateO2M(@RequestBody PactRequestVo requestVo){
        Map<String,Object> map = pactRecordService.pactGenerateO2M(requestVo.getPlatform(),requestVo.getFileDate(),requestVo.getPactFlag(),requestVo.getBusinessId(),requestVo.getPactVersionId(),requestVo.getO2mUserId());
        if(!(boolean)map.get("result")){
            return R.error((String) map.get("msg"));
        }
        return R.ok().put("data",map);
    }

    /**
     * 查询转让标合同是否生成
     * @param requestVo
     * @return isExist、pactPath
     */
    @RequestMapping(value = "/pactPathO2M",method = RequestMethod.POST)
    public  @ResponseBody R pactPathO2M(@RequestBody PactRequestVo requestVo){
        PactRecordEntity query = new PactRecordEntity();
        query.setPlatform(requestVo.getPlatform());
        query.setPactFlag(requestVo.getPactFlag());
        query.setPactFlagId(requestVo.getBusinessId());
        query.setO2mUserId(requestVo.getO2mUserId());
        Map<String,Object> map = pactRecordService.queryPactPath(query);

        Map<String,Object> resultMap = new HashMap<String,Object>();
        if(map == null || StringUtils.isEmpty(map.get("pactPath"))){
            resultMap.put("isExist",0);
        }else{
            resultMap.put("isExist",1);
            resultMap.put("pactPath",map.get("pactPath"));
        }
        return R.ok().put("data",resultMap);
    }

}
