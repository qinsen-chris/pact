package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.PactDictRelationEntity;

import java.util.List;
import java.util.Map;

/**
 * 字典协议关联
 * Created by chenmy on 2018/4/25.
 */
public interface PactDictRelationService {
    /**
     * 保存
     */
    void save(PactDictRelationEntity pactDictRelation);
    /**
     * 更新
     */
    int update(PactDictRelationEntity pactDictRelation);
    /**
     * 批量删除
     */
    int deleteBatch(Long[] pactIds);
    /**
     * 查询总数
     */
    int queryTotal(Map<String, Object> map);
    /**
     * 查询列表
     */
    List<PactDictRelationEntity> queryList(Map<String, Object> map);

    /**
     * 查询列表
     */
    List<Map<String,Object>> queryPactDictRelationList(Map<String,Object> map);

}
