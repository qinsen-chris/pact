package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactTemplateEntity;
import com.gclfax.modules.pact.service.PactTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
@Controller
@RequestMapping("/pactTemplate")
public class PactTemplateController {

    @Autowired
    private PactTemplateService pactTemplateService;

    @SysLog("保存模板")
    @RequestMapping("/save")
    public R save(@RequestBody PactTemplateEntity pactTemplate){
        pactTemplateService.save(pactTemplate);
        return R.ok();
    }

    @SysLog("修改模板")
    @RequestMapping("/update")
    public R update(@RequestBody Map<String,Object> map){
        pactTemplateService.update(map);
        return R.ok();
    }



}
