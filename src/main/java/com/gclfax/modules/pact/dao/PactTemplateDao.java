package com.gclfax.modules.pact.dao;

import com.gclfax.modules.pact.entity.PactTemplateEntity;
import com.gclfax.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PactTemplateDao extends BaseDao<PactTemplateEntity>{

    List<Map<String,Object>> queryPactTemplate(Map<String, Object> map);

    int queryTotalTemp(Map<String, Object> map);
}