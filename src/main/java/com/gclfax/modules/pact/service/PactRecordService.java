package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.PactRecordEntity;

/**
 * 模板替换字字典
 * Created by chenmy on 2018/4/25.
 */
public interface PactRecordService {

    void save(PactRecordEntity pactRecordEntity);

    /**
     * 协议生成
     * @param platform
     * @param pactFlag
     * @param pactFlagId
     * @param templateId
     */
    void pactRecordService(String platform,String pactFlag,Long pactFlagId,Long templateId,Object ... obj);
}
