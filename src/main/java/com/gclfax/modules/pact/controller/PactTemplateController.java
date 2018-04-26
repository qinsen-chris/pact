package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.constants.PlatformEnum;
import com.gclfax.common.utils.PageUtils;
import com.gclfax.common.utils.Query;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactTemplateEntity;
import com.gclfax.modules.pact.service.PactTemplateService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
@RestController
@RequestMapping("/pactTemplate")
public class PactTemplateController {

    @Autowired
    private PactTemplateService pactTemplateService;

    /**
     * 所有用户列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("pact:user:list")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);
        List<PactTemplateEntity> userList = pactTemplateService.queryList(query);
        int total = pactTemplateService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(userList, total, query.getLimit(), query.getPage());
        List<String> platformList = new ArrayList<String>();
        platformList.add(PlatformEnum.GXS_CG.getCode());
        platformList.add(PlatformEnum.GXS_HF.getCode());

        R r =  R.ok();
        r.put("page", pageUtil);
        r.put("platformEnum",platformList);
        return r;
    }

    /**
     * 获取模板信息
     */
    @RequestMapping("/info/{pactId}")
    //@RequiresPermissions("sys:user:info")
    public R info(@PathVariable("pactId") Long pactId){
        //查询列表数据
        PactTemplateEntity pact = pactTemplateService.queryObject(pactId);

        List<String> platformList = new ArrayList<String>();
        platformList.add(PlatformEnum.GXS_CG.getCode());
        platformList.add(PlatformEnum.GXS_HF.getCode());

        R r =  R.ok();
        r.put("pact", pact);
        r.put("platformEnum",platformList);
        return r;
    }

    @SysLog("保存模板")
    @RequestMapping("/save")
    public R save(@RequestBody PactTemplateEntity pactTemplate){
        pactTemplate.setCreateTime(new Date());
        pactTemplateService.save(pactTemplate);
        return R.ok();
    }

    @SysLog("修改模板")
    @RequestMapping("/update")
    public R update(@RequestBody PactTemplateEntity pactTemplate){
        pactTemplateService.update(pactTemplate);
        return R.ok();
    }

    @SysLog("删除模板")
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] pactIds){
        pactTemplateService.deleteBatch(pactIds);
        return R.ok();
    }

}
