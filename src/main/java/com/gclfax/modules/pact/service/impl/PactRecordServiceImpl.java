package com.gclfax.modules.pact.service.impl;

import com.gclfax.common.constants.PactFlagEnum;
import com.gclfax.common.constants.PlatformEnum;
import com.gclfax.common.exception.RRException;
import com.gclfax.common.utils.DateUtils;
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
    public Map<String, Object> pactCreate(Map<String, Object> paramsMap) {
        Map<String,Object> resultMap = new HashMap<String,Object>();
        String filePath,platform,fileDate,pactFlag,fields;
        Long pactVersionId,businessId;
        platform = (String) paramsMap.get("platform");
        fileDate = (String) paramsMap.get("fileDate");
        pactFlag = (String) paramsMap.get("pactFlag");
        businessId = Long.parseLong(paramsMap.get("businessId")+"");
        pactVersionId = Long.parseLong(paramsMap.get("pactVersionId")+"");
        Map requestMap = (Map) paramsMap.get("replaceMap");
        //获取模板
        PactVersionEntity pactVersionEntity = pactVersionService.findById(pactVersionId);
        //根据Path获取模板文件
        filePath = pactVersionEntity.getPactPath();
        fields = pactVersionEntity.getParams();
        String targerPath = pactPath+platform+"/"+ fileDate+"/";
        String targetFileName,investId = "0";
        if (PactFlagEnum.O2M_BID.getCode().equals(pactFlag)){
            investId = paramsMap.get("investId")+"";
            targetFileName = pactFlag+"_"+businessId+"_"+investId+".pdf";
        }else{
            targetFileName = pactFlag+"_"+businessId+".pdf";
        }
        //转换请求参数
        Map<String, Object> params = parseRequestParams(fields, requestMap);
        try {
            //模板占位参数转换
            ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targerPath,targetFileName,params);
        } catch (Exception e) {
            LOGGER.error("生成合同异常！platform：{}，pactFlag：{}，pactFlagId：{}",platform,pactFlag,businessId,e);
            resultMap.put("result",false);
            resultMap.put("msg","生成合同异常！");
            return resultMap;
        }
        //生成保存协议
        PactRecordEntity record = new PactRecordEntity();
        record.setPactPath(targerPath+targetFileName);
        record.setPactFlag(pactFlag);
        record.setBusinessId(businessId);
        record.setPlatform(platform);
        record.setCreateTime(new Date());
        if (PactFlagEnum.O2M_BID.getCode().equals(pactFlag)){
            record.setInvestId(Long.valueOf(investId));
        }
        save(record);
        resultMap.put("result",true);
        resultMap.put("msg","success");
        resultMap.put("pactPath",record.getPactPath());
        return resultMap;
    }

    private Map<String, Object> parseRequestParams(String fields, Map<String,Object> requestMap) {
        Assert.isBlank(fields,"必输模板占位参数不能为空！");
        Assert.isNull(requestMap,"请求替换模板参数不能为空！");
        List<String> localParams = new ArrayList<>();
        Collections.addAll(localParams, fields.replaceAll("[\\s*|\\t|\\r|\\n]", "").split("[,]"));
        Map<String,Object> param = new HashMap<>();
        for (String key : localParams) {
            if(requestMap.containsKey(key)){
                param.put(key,requestMap.get(key));
            } else {
                param.put(key,"");
            }
        }
        return param;
    }

    @Override
    public Map<String,Object> pactRecordService(String platform,String fileDate,String pactFlag,Long businessId,Long pactVersionId,Object ... obj) {
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
        Assert.isNull(businessId, pactFlag+"ID不能为空");
        Assert.isNull(pactVersionId, "pactVersionId不能为空");

        //获取模板
        PactVersionEntity pactVersionEntity = pactVersionService.findById(pactVersionId);
        //根据Path获取模板文件
        String filePath = pactVersionEntity.getPactPath();
        Date date = new Date();
        String targerPath = pactPath+platform+"/"+ fileDate+"/";
        String targetFileName = pactFlag+"_"+businessId+".pdf";

        //获取模板参数
        List params = new ArrayList();
        params.add(businessId);
        for (Object param : obj) {
            params.add(param);
        }

        try {
            //模板占位参数转换
            Map<String, Object> paramMap = getPactParamMapByTemplateId(pactFlag,pactVersionEntity.getPactTemplateId(),params);
            ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targerPath,targetFileName,paramMap);
        } catch (Exception e) {
            LOGGER.error("生成合同异常！platform：{}，pactFlag：{}，pactFlagId：{}",platform,pactFlag,businessId,e);
            resultMap.put("result",false);
            resultMap.put("msg","生成合同异常！");
            return resultMap;
        }

        //生成保存协议
        PactRecordEntity record = new PactRecordEntity();
        record.setPactPath(targerPath+targetFileName);
        record.setPactFlag(pactFlag);
        record.setBusinessId(businessId);
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
        String dictKey,dictValue,resultType,errorInfo,contractNo="";
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

            //查询有几个占位符
            int i = counter(dictValue,'?');
            Object[] obj = new Object[i];
            if (params.size() < i){
                errorInfo = "占位符与参数不匹配："+dictKey+": SQL :"+dictValue+"参数值："+params.toString();
                LOGGER.error(errorInfo);
                throw new RRException(errorInfo);
            }else{
                //设置查询参数
                for (int j = 0; j < i ; j++) {
                    obj[j] = params.get(j);
                }
            }

            //执行dictValue的SQL
            Object value = jdbcTemplate.queryForObject(dictValue,Object.class,obj);
            if (isMust && value == null){
                errorInfo = dictKey+"，是必须参数，值不能为空！";
                LOGGER.error(errorInfo);
                throw new RRException(errorInfo);
            }

            resutlMap.put(dictKey,value);
        }

        //合同编号，生成投资合同时才需要
        if (PactFlagEnum.INVEST.getCode().equals(pactFlag) || PactFlagEnum.O2M_INVEST.getCode().equals(pactFlag)){
            Long investId = (Long) params.get(0);
            contractNo = getPactNo(investId);
        }
        resutlMap.put("contractNo",contractNo);

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

    /**
     * 获取合同编号，生成合同时才有
     * @param investId
     * @return
     */
    public String getPactNo(Long investId){
        String sql = "select CONCAT(c.first_category,'-',c.second_category) from xiaofeng.t_products p join xiaofeng.t_bids b on p.id = b.product_id join xiaofeng.t_invests i on i.bid_id = b.id join xiaofeng.t_contract_category c on p.contract_category_id=c.id where i.id = ? ";
        //处理新生成合同流水号
        String contractNoPrefix = jdbcTemplate.queryForObject(sql,String.class,investId);
        String currentDateStr = DateUtils.format(new Date(), DateUtils.DATE_PATTERN);
        Integer nextContractNo = jdbcTemplate.queryForObject("select max(pact_no) from xiaofeng.t_invests where time > ?",Integer.class,currentDateStr);
        nextContractNo = (nextContractNo == null ? 1 : nextContractNo + 1);
        return contractNoPrefix+"-"+String.format("%05d", nextContractNo);
    }

    @Override
    public Map<String, Object> pactGenerateO2M(String platform, String fileDate, String pactFlag, Long businessId, Long pactVersionId, Long investId) {
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
        Assert.isNull(businessId, pactFlag+"ID不能为空");
        Assert.isNull(pactVersionId, "pactVersionId不能为空");

        //获取模板
        PactVersionEntity pactVersionEntity = pactVersionService.findById(pactVersionId);
        //根据Path获取模板文件
        String filePath = pactVersionEntity.getPactPath();
        Date date = new Date();
        String targerPath = pactPath+platform+"/"+ fileDate+"/";
        String targetFileName = pactFlag+"_"+businessId+"_"+investId+".pdf";

        //获取模板参数
        List params = new ArrayList();
        params.add(businessId);
        params.add(investId);

        try {
            //模板占位参数转换
            Map<String, Object> paramMap = getPactParamMapByTemplateId(pactFlag,pactVersionEntity.getPactTemplateId(),params);
            ReplaceAndToHtmlUtils.replaceAndToPdf(filePath,targerPath,targetFileName,paramMap);
        } catch (Exception e) {
            LOGGER.error("生成合同异常！platform：{}，pactFlag：{}，pactFlagId：{}",platform,pactFlag,businessId,e);
            resultMap.put("result",false);
            resultMap.put("msg","生成合同异常！");
            return resultMap;
        }

        //生成保存协议
        PactRecordEntity record = new PactRecordEntity();
        record.setPactPath(targerPath+targetFileName);
        record.setPactFlag(pactFlag);
        record.setBusinessId(businessId);
        record.setPlatform(platform);
        record.setInvestId(investId);
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
