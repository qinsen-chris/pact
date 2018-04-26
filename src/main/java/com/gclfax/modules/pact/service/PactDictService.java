package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.PactDictEntity;

import java.util.List;
import java.util.Map;

/**
 * 模板替换字字典
 * Created by chenmy on 2018/4/25.
 */
public interface PactDictService {

    void save(PactDictEntity pactDictEntity);

    int update(PactDictEntity pactDictEntity);

    int deleteBatch(Long[] pactIds);
    /**
     * 查询总数
     */
    int queryTotal(Map<String, Object> map);

    List<PactDictEntity> queryList(Map<String, Object> map);

}
