package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.PactTemplateEntity;

import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
public interface PactTemplateService {

    /**
     * 保存
     * @param pactTemplate
     */
    void save(PactTemplateEntity pactTemplate);

    /**
     * 更新模板
     * @param pactTemplate
     * @return
     */
    int update(PactTemplateEntity pactTemplate);

    /**
     * 查询列表
     * @param map
     * @return
     */
    List<PactTemplateEntity> queryList(Map<String, Object> map);

    /**
     * 查询总数
     */
    int queryTotal(Map<String, Object> map);

    /**
     * 根据主键查询
     * @param pactId
     * @return
     */
    PactTemplateEntity queryObject(Long pactId);

    /**
     * 删除模板
     * @param pactIds
     * @return
     */
    int deleteBatch(Long[] pactIds);
}
