package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.constants.PlatformEnum;
import com.gclfax.common.exception.RRException;
import com.gclfax.common.utils.PageUtils;
import com.gclfax.common.utils.Query;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactTemplateEntity;
import com.gclfax.modules.pact.service.PactTemplateService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ClassUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by chenmy on 2018/4/25.
 */
@RestController
@RequestMapping("/pactTemplate")
public class PactTemplateController {
    Logger LOGGER = LoggerFactory.getLogger(PactTemplateController.class);

    @Value("${gclfax.pactPath}")
    private String pactPath;

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

    /**
     * 上传文件
     */
    @RequestMapping("/upload")
    public R upload(@RequestParam("file") MultipartFile file,@RequestParam("platform") String platform) throws Exception {
        if (file.isEmpty()) {
            throw new RRException("上传文件不能为空！");
        }
        if(StringUtils.isEmpty(platform)){
            throw new RRException("平台标识不能为空！");
        }
        // 获取文件名
        String fileName = file.getOriginalFilename();
        LOGGER.info("上传的文件名为：" + fileName);

        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        LOGGER.info("上传的后缀名为：" + suffixName);

        // 文件上传路径
        String filePath = pactPath+platform+"/baseTemp";

        // 解决中文问题，liunx下中文路径，图片显示问题
        fileName = UUID.randomUUID() + suffixName;
        File dest = new File(filePath + fileName);

        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }

        try {
            file.transferTo(dest);
        } catch (IllegalStateException ille) {
            LOGGER.error("IllegalStateException",ille);
        } catch (IOException ioe) {
            LOGGER.error("文件输入输出流异常",ioe);
        }
        return R.ok().put("filePath", filePath+fileName);
    }

}
