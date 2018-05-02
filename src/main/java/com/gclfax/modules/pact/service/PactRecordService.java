package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.PactRecordEntity;

import java.util.Map;

/**
 * 模板替换字字典
 * Created by chenmy on 2018/4/25.
 */
public interface PactRecordService {

    void save(PactRecordEntity pactRecordEntity);

    /**
     * 协议生成
     * @param platform
     * @param fileDate
     * @param pactFlag
     * @param pactFlagId
     * @param pactVersionId
     */
    Map<String,Object> pactRecordService(String platform,String fileDate,String pactFlag,Long pactFlagId,Long pactVersionId,Object ... obj);

    /**
     * 查询文件路径
     * @param platfrom
     * @param pactFlag
     * @param pactFlagId
     * @return
     */
    Map<String,Object> queryPactPath(String platfrom, String pactFlag, Long pactFlagId);

    /**
     * 转让标协议生成
     * @param platform
     * @param fileDate
     * @param pactFlag
     * @param pactFlagId
     * @param pactVersionId
     */
    Map<String,Object> pactGenerateO2M(String platform, String fileDate, String pactFlag, Long pactFlagId, Long pactVersionId, Long o2mUserId);
}
