package com.gclfax.modules.pact.dao;

import com.gclfax.modules.pact.entity.ActivityBaseEntity;
import com.gclfax.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 活动基础信息表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
@Mapper
public interface ActivityBaseDao extends BaseDao<ActivityBaseEntity> {
	
}
