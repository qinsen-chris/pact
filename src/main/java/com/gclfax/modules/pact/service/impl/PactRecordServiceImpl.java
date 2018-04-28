package com.gclfax.modules.pact.service.impl;

import com.gclfax.common.constants.PactFlagEnum;
import com.gclfax.common.constants.PlatformEnum;
import com.gclfax.common.utils.DateUtils;
import com.gclfax.common.utils.ReplaceAndToHtmlUtils;
import com.gclfax.common.validator.Assert;
import com.gclfax.modules.pact.dao.PactRecordDao;
import com.gclfax.modules.pact.entity.PactRecordEntity;
import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.pact.service.PactDictService;
import com.gclfax.modules.pact.service.PactRecordService;
import com.gclfax.modules.pact.service.PactVersionService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/27.
 */
@Service
public class PactRecordServiceImpl implements PactRecordService {

    Logger LOGGER = LoggerFactory.getLogger(PactRecordServiceImpl.class);

    @Autowired
    private PactRecordDao pactRecordDao;
    @Autowired
    private PactVersionService pactVersionService;
    @Autowired
    private PactDictService pactDictService;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Value("${gclfax.pactPath}")
    private String pactPath;

    @Override
    public void save(PactRecordEntity pactRecordEntity) {
        pactRecordDao.save(pactRecordEntity);
    }


    @Override
    public void pactRecordService(String platform,String pactFlag,Long pactFlagId,Long pactVersionId,Object ... obj) {
        if(StringUtils.isEmpty(pactFlag) || !PactFlagEnum.BID.getCode().equals(pactFlag)
                || !PactFlagEnum.TRANS.getCode().equals(pactFlag)
                || !PactFlagEnum.INVEST.getCode().equals(pactFlag)
                || !PactFlagEnum.O2M_INVEST.getCode().equals(pactFlag) ){
            LOGGER.error("pactFlag标识错误 : "+pactFlag);
            return;
        }
        if(StringUtils.isEmpty(platform) || !PlatformEnum.GXS_CG.getCode().equals(platform)
                || !PlatformEnum.GXS_HF.getCode().equals(platform) ){
            LOGGER.error("platform标识错误 : "+platform);
            return;
        }
        Assert.isNull(pactFlagId, pactFlag+"ID不能为空");
        Assert.isNull(pactVersionId, "templateId不能为空");
        //获取模板
        PactVersionEntity pactTemplate = pactVersionService.findById(pactVersionId);
        //根据Path获取模板文件
        String filePath = pactTemplate.getPactPath();
        Date date = new Date();
        String targerPath = pactPath+platform+"/"+ DateUtils.format(date,DateUtils.YYYYMM_PATTERN)+"/";
        String targetFileName = pactFlag+"_"+pactFlagId+".pdf";
        //获取模板参数
        Map<String, Object> resutlMap = getPactParamMapByTemplateId(pactVersionId,pactFlagId);

        //模板占位参数转换
        ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targerPath,targetFileName,resutlMap);

        //生成保存协议
        PactRecordEntity record = new PactRecordEntity();
        record.setPactPath(targerPath+targetFileName);
        record.setFileSign(targetFileName);
        record.setPlatform(platform);
        record.setCreateTime(date);
        save(record);
    }

    /**
     * 根据模板Id,获取替换参数
     * @param templateId
     * @return
     */
    private Map<String,Object> getPactParamMapByTemplateId(Long templateId,Long id){
        Map<String, Object> resutlMap = new HashMap();
        List<Map<String, Object>> mapList = pactDictService.queryListByTemplateId(templateId);

        String dictKey,dictValue,resultType;
        Boolean isMust;
        for (Map<String, Object> map : mapList) {
            dictKey = (String) map.get("dictKey");
            dictValue = (String) map.get("dictValue");
            resultType = (String) map.get("resultType");
            isMust = (Boolean) map.get("isMust");
            Object value = jdbcTemplate.queryForObject(dictValue,Object.class,id);
            if (isMust){
                Assert.isNull(value,dictKey+"，是必须参数，值不能为空！");
            }
            resutlMap.put(dictKey,value);
        }
        return resutlMap;
    }





}
