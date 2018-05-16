package com.gclfax.modules.pact.controller;

import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactRecordEntity;
import com.gclfax.modules.pact.service.PactRecordService;
import com.gclfax.modules.pact.service.PactTemplateService;
import com.gclfax.modules.pact.vo.PactRequestVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    Logger LOGGER = LoggerFactory.getLogger(PactController.class);

    @Autowired
    private PactTemplateService pactTemplateService;
    @Autowired
    private PactRecordService pactRecordService;

    /**
     * 生成合同
     * @param map
     * @return
     */
    @RequestMapping(value = "/pactCreate",method = RequestMethod.POST)
    public @ResponseBody R pactCreate(@RequestBody Map<String,Object> map){
        LOGGER.info("POST请求生成合同开始！------------------- {}",map.toString());
        Map<String,Object> result = pactRecordService.pactCreate(map);
        if(!(boolean)result.get("result")){
            return R.error((String) result.get("msg"));
        }
        LOGGER.info("POST请求生成合同结束！------------------- {}",result.toString());
        return R.ok().put("data",result);
    }

    /**
     * 查询模板列表
     * @param
     * @return
     */
    @RequestMapping(value = "/pactTemp",method = RequestMethod.GET)
    public R pactTemp(@RequestParam String platform){
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("platform",platform);
        LOGGER.info("查询平台合同协议模板！------------------- {}",paramMap.toString());
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
        query.setBusinessId(requestVo.getBusinessId());
        LOGGER.info("查询合同是否已存在。pactFlag:{} ,businessId:{} ",requestVo.getPactFlag(),requestVo.getBusinessId());
        Map<String,Object> map = pactRecordService.queryPactPath(query);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        if(map == null || StringUtils.isEmpty(map.get("pactPath"))){
            resultMap.put("isExist",0);
        }else{
            resultMap.put("isExist",1);
            resultMap.put("pactPath",map.get("pactPath"));
        }
        LOGGER.info("查询合同是否已存在，结果：{}",resultMap.toString());
        return R.ok().put("data",resultMap);
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
        query.setBusinessId(requestVo.getBusinessId());
        query.setInvestId(requestVo.getInvestId());
        LOGGER.info("查询转让合同是否已存在。pactFlag:{} ，InvestId：{}", requestVo.getPactFlag(),requestVo.getInvestId());
        Map<String,Object> map = pactRecordService.queryPactPath(query);

        Map<String,Object> resultMap = new HashMap<String,Object>();
        if(map == null || StringUtils.isEmpty(map.get("pactPath"))){
            resultMap.put("isExist",0);
        }else{
            resultMap.put("isExist",1);
            resultMap.put("pactPath",map.get("pactPath"));
        }
        LOGGER.info("查询转让合同是否已存在结果：{}",resultMap.toString());
        return R.ok().put("data",resultMap);
    }


    /**
     * 生成合同
     * @param vo
     * @return
     */
    @RequestMapping(value = "/pactGenerate",method = RequestMethod.POST)
    public @ResponseBody R pactGenerate(@RequestBody PactRequestVo vo){
        Map<String,Object> map = pactRecordService.pactRecordService(vo.getPlatform(),vo.getFileDate(),vo.getPactFlag(),vo.getBusinessId(),vo.getPactVersionId());
        if(!(boolean)map.get("result")){
            return R.error((String) map.get("msg"));
        }
        return R.ok().put("data",map);
    }

    /**
     * 生成转让标合同
     * @param vo
     * @return
     */
    @RequestMapping(value = "/pactGenerateO2M",method = RequestMethod.POST)
    public @ResponseBody R pactGenerateO2M(@RequestBody PactRequestVo vo){
        Map<String,Object> map = pactRecordService.pactGenerateO2M(vo.getPlatform(),vo.getFileDate(),vo.getPactFlag(),vo.getBusinessId(),vo.getPactVersionId(),vo.getInvestId());
        if(!(boolean)map.get("result")){
            return R.error((String) map.get("msg"));
        }
        return R.ok().put("data",map);
    }

}
