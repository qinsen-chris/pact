package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactDictEntity;
import com.gclfax.modules.pact.service.PactDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by chenmy on 2018/4/25.
 */
@Controller
@RequestMapping("/pactDict")
public class PactDictController {

    @Autowired
    private PactDictService pactDictService;

    @SysLog("保存字典")
    @RequestMapping("/save")
    public R save(@RequestBody PactDictEntity pactDict){
        pactDictService.save(pactDict);
        return R.ok();
    }

}
