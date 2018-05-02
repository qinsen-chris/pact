package com.gclfax.modules.pact.dao;

import com.gclfax.modules.pact.entity.PactRecordEntity;
import com.gclfax.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface PactRecordDao extends BaseDao<PactRecordEntity>{

    Map<String,Object> queryPactPath(@Param("platform") String platform, @Param("pactFlag") String pactFlag,@Param("pactFlagId") Long pactFlagId);
}