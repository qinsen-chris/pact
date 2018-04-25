package com.gclfax.modules.pact.dao;

import com.gclfax.modules.pact.entity.ActivityShareEntity;
import com.gclfax.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户分享活动记录表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
@Mapper
public interface ActivityShareDao extends BaseDao<ActivityShareEntity> {
	
}
