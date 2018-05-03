package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.utils.PageUtils;
import com.gclfax.common.utils.Query;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.RelationGenerateTypeEntity;
import com.gclfax.modules.pact.service.RelationGenerateTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/5/3.
 */
@RestController
@RequestMapping("/relationGenerateType")
public class RelationGenerateTypeController{

    @Autowired
    private RelationGenerateTypeService generateTypeService;


    /**
     * 保存
     */
    @SysLog("保存生成合同类型")
    @RequestMapping("/save")
    @RequiresPermissions("relationGenerateType:save")
    public R save(@RequestBody RelationGenerateTypeEntity generateTypeEntity){
        generateTypeService.save(generateTypeEntity);
        return R.ok();
    }

    /**
     * 修改
     */
    @SysLog("修改生成合同类型")
    @RequestMapping("/update")
    @RequiresPermissions("relationGenerateType:update")
    public R update(@RequestBody RelationGenerateTypeEntity generateTypeEntity){
        generateTypeService.update(generateTypeEntity);
        return R.ok();
    }

    /**
     * 模板字典列表
     */
    @SysLog("模板字典列表")
    @RequestMapping("/list")
    @RequiresPermissions("relationGenerateType:list")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);
        List<Map<String,Object>> queryList = generateTypeService.queryMapList(query);
        int total = generateTypeService.queryTotal(query);
        PageUtils pageUtil = new PageUtils(queryList, total, query.getLimit(), query.getPage());
        return R.ok().put("page", pageUtil);
    }

    /**
     * 删除模板字典
     */
    @SysLog("删除模板字典")
    @RequestMapping("/delete")
    @RequiresPermissions("relationGenerateType:delete")
    public R delete(@RequestBody Long[] ids){
        generateTypeService.deleteBatch(ids);
        return R.ok();
    }
}
