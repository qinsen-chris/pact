package com.gclfax.modules.job.dao;

import org.apache.ibatis.annotations.Mapper;

import com.gclfax.modules.job.entity.ScheduleJobLogEntity;
import com.gclfax.modules.sys.dao.BaseDao;

/**
 * 定时任务日志
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月1日 下午10:30:02
 */
@Mapper
public interface ScheduleJobLogDao extends BaseDao<ScheduleJobLogEntity> {
	
}
