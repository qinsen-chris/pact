package com.gclfax.modules.pact.service.impl;

import com.gclfax.common.constants.PactFlagEnum;
import com.gclfax.common.constants.PlatformEnum;
import com.gclfax.common.exception.RRException;
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

import java.util.*;

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
    public void pactRecordService(String platform,String fileDate,String pactFlag,Long pactFlagId,Long pactVersionId,Object ... obj) {
        if(StringUtils.isEmpty(pactFlag) || !(PactFlagEnum.BID.getCode().equals(pactFlag)
                || PactFlagEnum.O2M_BID.getCode().equals(pactFlag)
                || PactFlagEnum.INVEST.getCode().equals(pactFlag)
                || PactFlagEnum.O2M_INVEST.getCode().equals(pactFlag) )){
            LOGGER.error("pactFlag标识错误 : "+pactFlag);
            return;
        }
        if(StringUtils.isEmpty(platform) || !(PlatformEnum.GXS_CG.getCode().equals(platform)
                || PlatformEnum.GXS_HF.getCode().equals(platform)) ){
            LOGGER.error("platform标识错误 : "+platform);
            return;
        }
        Assert.isNull(pactFlagId, pactFlag+"ID不能为空");
        Assert.isNull(pactVersionId, "pactVersionId不能为空");

        //获取模板
        PactVersionEntity pactVersionEntity = pactVersionService.findById(pactVersionId);
        //根据Path获取模板文件
        String filePath = pactVersionEntity.getPactPath();
        Date date = new Date();
        String targerPath = pactPath+platform+"/"+ fileDate+"/";
        String targetFileName = pactFlag+"_"+pactFlagId+".pdf";

        //获取模板参数
        List params = new ArrayList();
        params.add(pactFlagId);
        for (Object param : obj) {
            params.add(param);
        }
        Map<String, Object> resutlMap = getPactParamMapByTemplateId(pactVersionEntity.getPactTemplateId(),params);

        //模板占位参数转换
        try {
            ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targerPath,targetFileName,resutlMap);
        } catch (Exception e) {
            LOGGER.error("生成合同异常！platform：{0}，pactFlag：{1}，pactFlagId：{2}",platform,pactFlag,pactFlagId,e);
        }

        //生成保存协议
        PactRecordEntity record = new PactRecordEntity();
        record.setPactPath(targerPath+targetFileName);
        record.setFileSign(pactFlag+"_"+pactFlagId);
        record.setPlatform(platform);
        record.setCreateTime(date);
        save(record);
    }

    /**
     * 根据模板Id,获取替换参数
     * @param pactVersionId
     * @return
     */
    private Map<String,Object> getPactParamMapByTemplateId(Long pactVersionId,List params){
        Map<String, Object> resutlMap = new HashMap();
        List<Map<String, Object>> mapList = pactDictService.queryListByTemplateId(pactVersionId);

        String dictKey,dictValue,resultType,errorInfo;
        Boolean isMust;
        for (Map<String, Object> map : mapList) {
            dictKey = (String) map.get("dictKey");
            dictValue = (String) map.get("dictValue");
            resultType = (String) map.get("resultType");
            isMust = (Boolean) map.get("isMust");

            int i = counter(dictValue,'?');
            if (params.size() < i){
                errorInfo = "占位符与参数不匹配："+dictKey+": SQL :"+dictValue+"参数值："+params.toString();
                LOGGER.error(errorInfo);
                throw new RRException(errorInfo);
            }

            String value = jdbcTemplate.queryForObject(dictValue,String.class,params.toArray());
            if (isMust){
                errorInfo = dictKey+"，是必须参数，值不能为空！";
                LOGGER.error(errorInfo);
                Assert.isNull(value,errorInfo);
            }
            resutlMap.put(dictKey,value);
        }
        return resutlMap;
    }

    private int counter(String s,char c){
        int count=0;
        for(int i=0;i<s.length();i++){
            if(s.charAt(i)==c){
                count++;
            }
        }
        return count;
    }

    @Override
    public Map<String, Object> queryPactPath(String platfrom, String pactFlag, Long pactFlagId) {
        return pactRecordDao.queryPactPath(platfrom,pactFlag+"_"+pactFlagId);
    }
}
