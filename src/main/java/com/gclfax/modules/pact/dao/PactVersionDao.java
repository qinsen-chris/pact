package com.gclfax.modules.pact.dao;

import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface PactVersionDao extends BaseDao<PactVersionEntity>{

    Map getMapById(Long id);

    int selectMaxVersionByParam(Map<String, Object> map);

    PactVersionEntity findByTemplateId(Long templateId);
}