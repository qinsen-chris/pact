package com.gclfax.modules.pact.controller;

import com.gclfax.common.utils.PageUtils;
import com.gclfax.common.utils.Query;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.pact.service.PactVersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * Create by qinsen on 2018/4/27
 */
@RestController
@RequestMapping("/pactVersion")
public class PactVersionController {
    @Autowired
    private PactVersionService pactVersionService;
    /**
     * 所有用户列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("pact:user:list")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);
        List<PactVersionEntity> userList = pactVersionService.queryList(query);
        int total = pactVersionService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(userList, total, query.getLimit(), query.getPage());

        R r =  R.ok();
        r.put("page", pageUtil);
        return r;
    }
}
