package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.RelationGenerateTypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 模板字典
 * Created by chenmy on 2018/4/25.
 */
public interface RelationGenerateTypeService {

    void save(RelationGenerateTypeEntity relationGenerateTypeEntity);

    int update(RelationGenerateTypeEntity relationGenerateTypeEntity);

    int deleteBatch(Long[] ids);

    int queryTotal(Map<String, Object> map);

    List<Map<String, Object>> queryMapList(Map<String, Object> map);
}
