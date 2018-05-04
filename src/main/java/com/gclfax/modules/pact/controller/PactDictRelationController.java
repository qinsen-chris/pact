package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.utils.PageUtils;
import com.gclfax.common.utils.Query;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactDictRelationEntity;
import com.gclfax.modules.pact.service.PactDictRelationService;
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
@RequestMapping("/pactDictRelation")
public class PactDictRelationController {

    @Autowired
    private PactDictRelationService pactDictRelationService;

    /**
     * 保存模板协议和字典关系
     */
    @SysLog("保存模板协议和字典关系")
    @RequestMapping("/save")
    @RequiresPermissions("pactDictRelation:save")
    public R save(@RequestBody PactDictRelationEntity pactDictRelation){
        int count = pactDictRelationService.isExist(pactDictRelation.getPactDictId(),pactDictRelation.getPactTemplateId());
        if(count > 0){
            return R.error(-1,"该字典和模板已存在");
        }
        pactDictRelationService.save(pactDictRelation);
        return R.ok();
    }

    /**
     * 修改模板协议和字典关系
     */
    @SysLog("修改模板协议和字典关系")
    @RequestMapping("/update")
    @RequiresPermissions("pactDictRelation:update")
    public R update(@RequestBody PactDictRelationEntity pactDictRelation){
        pactDictRelationService.update(pactDictRelation);
        return R.ok();
    }

    /**
     * 模板协议和字典关系列表
     */
    @SysLog("模板协议和字典关系列表")
    @RequestMapping("/list")
    @RequiresPermissions("pactDictRelation:list")
    public R list(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);
        List<Map<String, Object>> queryList = pactDictRelationService.queryPactDictRelationList(query);
        int total = pactDictRelationService.queryTotal(query);
        PageUtils pageUtil = new PageUtils(queryList, total, query.getLimit(), query.getPage());
        return R.ok().put("page", pageUtil);
    }

    /**
     * 删除模板协议和字典关系
     */
    @SysLog("删除模板协议和字典关系")
    @RequestMapping("/delete")
    @RequiresPermissions("pactDictRelation:delete")
    public R delete(@RequestBody Long[] pactIds){
        pactDictRelationService.deleteBatch(pactIds);
        return R.ok();
    }

}
