package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.PactVersionEntity;

import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
public interface PactVersionService {

    void save(PactVersionEntity pactVersionEntity);

    int update(PactVersionEntity pactVersionEntity);

    PactVersionEntity findById(Long id);

    Map getMapById(Long id);

    /**
     * 查询列表
     * @param map
     * @return
     */
    List<PactVersionEntity> queryList(Map<String, Object> map);

    /**
     * 查询总数
     */
    int queryTotal(Map<String, Object> map);

    int selectMaxVersionByParam(Map<String, Object> map);

    PactVersionEntity findByTemplateId(Long templateId);
}
