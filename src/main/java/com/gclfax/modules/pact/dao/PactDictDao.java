package com.gclfax.modules.pact.dao;

import com.gclfax.modules.pact.entity.PactDictEntity;
import com.gclfax.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PactDictDao extends BaseDao<PactDictEntity>{

    List<Map<String, Object>> queryListByTemplateId(Long id);
}