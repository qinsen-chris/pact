package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.utils.PageUtils;
import com.gclfax.common.utils.Query;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactDictEntity;
import com.gclfax.modules.pact.service.PactDictService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
@RestController
@RequestMapping("/pactDict")
public class PactDictController {

    @Autowired
    private PactDictService pactDictService;

    /**
     * 保存模板字典
     */
    @SysLog("保存模板字典")
    @RequestMapping("/save")
    @RequiresPermissions("pactDict:save")
    public R save(@RequestBody PactDictEntity pactDict){
        pactDictService.save(pactDict);
        return R.ok();
    }

    /**
     * 修改模板字典
     */
    @SysLog("修改模板字典")
    @RequestMapping("/update")
    @RequiresPermissions("pactDict:update")
    public R update(@RequestBody PactDictEntity pactDict){
        pactDictService.update(pactDict);
        return R.ok();
    }

    /**
     * 模板字典列表
     */
    @SysLog("模板字典列表")
    @RequestMapping("/list")
    @RequiresPermissions("pactDict:list")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);
        List<PactDictEntity> queryList = pactDictService.queryList(query);
        int total = pactDictService.queryTotal(query);
        PageUtils pageUtil = new PageUtils(queryList, total, query.getLimit(), query.getPage());
        return R.ok().put("page", pageUtil);
    }

    /**
     * 删除模板字典
     */
    @SysLog("删除模板字典")
    @RequestMapping("/delete")
    @RequiresPermissions("pactDict:delete")
    public R delete(@RequestBody Long[] pactIds){
        pactDictService.deleteBatch(pactIds);
        return R.ok();
    }
}
