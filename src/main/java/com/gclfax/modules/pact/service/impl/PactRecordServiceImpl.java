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
import com.gclfax.modules.pact.service.RelationGenerateTypeService;
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
    private RelationGenerateTypeService generateTypeService;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Value("${gclfax.pactPath}")
    private String pactPath;

    @Override
    public void save(PactRecordEntity pactRecordEntity) {
        pactRecordDao.save(pactRecordEntity);
    }


    @Override
    public Map<String,Object> pactRecordService(String platform,String fileDate,String pactFlag,Long pactFlagId,Long pactVersionId,Object ... obj) {
        Map<String,Object> resultMap = new HashMap<String,Object>();
        if(StringUtils.isEmpty(pactFlag) || !(PactFlagEnum.BID.getCode().equals(pactFlag)
                || PactFlagEnum.O2M_BID.getCode().equals(pactFlag)
                || PactFlagEnum.INVEST.getCode().equals(pactFlag)
                || PactFlagEnum.O2M_INVEST.getCode().equals(pactFlag) )){
            LOGGER.error("pactFlag标识错误 : "+pactFlag);
            resultMap.put("result",false);
            resultMap.put("msg","pactFlag标识错误,只能是bid、o2m_bid、invest、o2m_invest中的一种！");
            return resultMap;
        }
        if(StringUtils.isEmpty(platform) || !(PlatformEnum.GXS_CG.getCode().equals(platform)
                || PlatformEnum.GXS_HF.getCode().equals(platform)) ){
            LOGGER.error("platform标识错误 : "+platform);
            resultMap.put("result",false);
            resultMap.put("msg","platform标识错误！");
            return resultMap;
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

        try {
            //模板占位参数转换
            Map<String, Object> paramMap = getPactParamMapByTemplateId(pactFlag,pactVersionEntity.getPactTemplateId(),params);
            ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targerPath,targetFileName,paramMap);
        } catch (Exception e) {
            LOGGER.error("生成合同异常！platform：{}，pactFlag：{}，pactFlagId：{}",platform,pactFlag,pactFlagId,e);
            resultMap.put("result",false);
            resultMap.put("msg","生成合同异常！");
            return resultMap;
        }

        //生成保存协议
        PactRecordEntity record = new PactRecordEntity();
        record.setPactPath(targerPath+targetFileName);
        record.setPactFlag(pactFlag);
        record.setPactFlagId(pactFlagId);
        record.setPlatform(platform);
        record.setCreateTime(date);
        save(record);
        resultMap.put("result",true);
        resultMap.put("msg","success");
        resultMap.put("pactPath",record.getPactPath());
        return resultMap;
    }

    /**
     * 根据模板Id,获取替换参数
     * @param pactTemplateId
     * @return
     */
    private Map<String,Object> getPactParamMapByTemplateId(String pactFlag,Long pactTemplateId,List params){
        Map<String, Object> resutlMap = new HashMap();
        List<Map<String, Object>> mapList = pactDictService.queryListByTemplateId(pactTemplateId);
        String dictKey,dictValue,resultType,errorInfo;
        Boolean isMust,bid,o2mBid,invest,o2mInvest;
        for (Map<String, Object> map : mapList) {
            dictKey = (String) map.get("dictKey");
            dictValue = (String) map.get("dictValue");
            resultType = (String) map.get("resultType");
            isMust = (Boolean) map.get("isMust");
            bid = (Boolean) map.get("bid");
            o2mBid = (Boolean) map.get("o2mBid");
            invest = (Boolean) map.get("invest");
            o2mInvest = (Boolean) map.get("o2mInvest");

            //模板参数部分替换排除
            if (PactFlagEnum.BID.getCode().equals(pactFlag) && !bid){
                resutlMap.put(dictKey,"");
                continue;
            } else if (PactFlagEnum.O2M_BID.getCode().equals(pactFlag) && !o2mBid){
                resutlMap.put(dictKey,"");
                continue;
            } else if (PactFlagEnum.INVEST.getCode().equals(pactFlag) && !invest){
                resutlMap.put(dictKey,"");
                continue;
            } else if (PactFlagEnum.O2M_INVEST.getCode().equals(pactFlag) && !o2mInvest){
                resutlMap.put(dictKey,"");
                continue;
            }


            int i = counter(dictValue,'?');
            Object[] obj = new Object[i];
            if (params.size() < i){
                errorInfo = "占位符与参数不匹配："+dictKey+": SQL :"+dictValue+"参数值："+params.toString();
                LOGGER.error(errorInfo);
                throw new RRException(errorInfo);
            }else{
                for (int j = 0; j < i ; j++) {
                    obj[j] = params.get(j);
                }
            }

            Object value = jdbcTemplate.queryForObject(dictValue,Object.class,obj);
            if (isMust && value == null){
                errorInfo = dictKey+"，是必须参数，值不能为空！";
                LOGGER.error(errorInfo);
                throw new RRException(errorInfo);
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
    public Map<String, Object> pactGenerateO2M(String platform, String fileDate, String pactFlag, Long pactFlagId, Long pactVersionId, Long o2mUserId) {
        Map<String,Object> resultMap = new HashMap<String,Object>();
        if(StringUtils.isEmpty(pactFlag) || !(PactFlagEnum.O2M_BID.getCode().equals(pactFlag))){
            LOGGER.error("pactFlag标识错误 : "+pactFlag);
            resultMap.put("result",false);
            resultMap.put("msg","pactFlag标识错误,只能是o2m_bid！");
            return resultMap;
        }
        if(StringUtils.isEmpty(platform) || !(PlatformEnum.GXS_CG.getCode().equals(platform)
                || PlatformEnum.GXS_HF.getCode().equals(platform)) ){
            LOGGER.error("platform标识错误 : "+platform);
            resultMap.put("result",false);
            resultMap.put("msg","platform标识错误！");
            return resultMap;
        }
        Assert.isNull(pactFlagId, pactFlag+"ID不能为空");
        Assert.isNull(pactVersionId, "pactVersionId不能为空");

        //获取模板
        PactVersionEntity pactVersionEntity = pactVersionService.findById(pactVersionId);
        //根据Path获取模板文件
        String filePath = pactVersionEntity.getPactPath();
        Date date = new Date();
        String targerPath = pactPath+platform+"/"+ fileDate+"/";
        String targetFileName = pactFlag+"_"+pactFlagId+"_"+o2mUserId+".pdf";

        //获取模板参数
        List params = new ArrayList();
        params.add(pactFlagId);
        params.add(o2mUserId);

        try {
            //模板占位参数转换
            Map<String, Object> paramMap = getPactParamMapByTemplateId(pactFlag,pactVersionEntity.getPactTemplateId(),params);
            ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targerPath,targetFileName,paramMap);
        } catch (Exception e) {
            LOGGER.error("生成合同异常！platform：{}，pactFlag：{}，pactFlagId：{}",platform,pactFlag,pactFlagId,e);
            resultMap.put("result",false);
            resultMap.put("msg","生成合同异常！");
            return resultMap;
        }

        //生成保存协议
        PactRecordEntity record = new PactRecordEntity();
        record.setPactPath(targerPath+targetFileName);
        record.setPactFlag(pactFlag);
        record.setPactFlagId(pactFlagId);
        record.setPlatform(platform);
        record.setO2mUserId(o2mUserId);
        record.setCreateTime(date);
        save(record);
        resultMap.put("result",true);
        resultMap.put("msg","success");
        resultMap.put("pactPath",record.getPactPath());
        return resultMap;
    }

    @Override
    public Map<String, Object> queryPactPath(PactRecordEntity pactRecord) {
        return pactRecordDao.queryPactPath(pactRecord);
    }
}
