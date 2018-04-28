package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.service.PactRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 协议生成
 * Created by chenmy on 2018/4/27.
 */
@RestController
@RequestMapping("/pactRecord")
public class PactRecordController {

    @Autowired
    private PactRecordService pactRecordService;


}
