package com.gclfax.modules.pact.dao;

import com.gclfax.modules.pact.entity.RelationGenerateTypeEntity;
import com.gclfax.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RelationGenerateTypeDao extends BaseDao<RelationGenerateTypeEntity>{

    List<Map<String,Object>> queryMapList(Map<String, Object> map);
}