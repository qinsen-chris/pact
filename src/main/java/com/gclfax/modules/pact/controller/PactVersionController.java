package com.gclfax.modules.pact.controller;

import com.gclfax.common.annotation.SysLog;
import com.gclfax.common.constants.PlatformEnum;
import com.gclfax.common.exception.RRException;
import com.gclfax.common.utils.PageUtils;
import com.gclfax.common.utils.Query;
import com.gclfax.common.utils.R;
import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.pact.service.PactVersionService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Create by qinsen on 2018/4/27
 */
@RestController
@RequestMapping("/pactVersion")
public class PactVersionController {

    Logger LOGGER = LoggerFactory.getLogger(PactVersionController.class);

    @Value("${gclfax.pactPath}")
    private String pactPath;

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

    /**
     * 获取模板信息
     */
    @RequestMapping("/info/{pactId}")
    //@RequiresPermissions("sys:user:info")
    public R info(@PathVariable("pactId") Long pactId){
        //查询列表数据
        PactVersionEntity pact = pactVersionService.findById(pactId);

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
    public R save(@RequestBody PactVersionEntity pactTemplate){
        if(pactTemplate.getPactTemplateId()==null){
            return R.error("模板不能为空！");
        }
        if(StringUtils.isEmpty(pactTemplate.getPactPath())){
            return R.error("模板路径不能为空！");
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("pactTemplateId",pactTemplate.getPactTemplateId());
        int version = pactVersionService.selectMaxVersionByParam(params);

        pactTemplate.setVersion(version+1);
        pactTemplate.setCreateTime(new Date());
        pactVersionService.save(pactTemplate);
        return R.ok();
    }

    @SysLog("修改模板")
    @RequestMapping("/update")
    public R update(@RequestBody PactVersionEntity pactTemplate){
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("pactTemplateId",pactTemplate.getPactTemplateId());
        int version = pactVersionService.selectMaxVersionByParam(params);
        pactTemplate.setVersion(version+1);
        pactTemplate.setCreateTime(new Date());
        pactVersionService.update(pactTemplate);

        return R.ok();
    }

    /**
     * 上传文件
     */
    @RequestMapping("/upload")
    public R upload(@RequestParam("file") MultipartFile file, @RequestParam("platform") String platform) throws Exception {
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
        String filePath = pactPath+platform+"/baseTemp/";

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
        return R.ok().put("pactPath", filePath+fileName);
    }
}
