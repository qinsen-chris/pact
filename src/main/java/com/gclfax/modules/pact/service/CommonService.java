package com.gclfax.modules.pact.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gclfax.modules.pact.dao.ActivityShareDao;
import com.gclfax.modules.pact.entity.ActivityShareEntity;

/**
 * 
 * @author chenwenjie
 *
 */
@Service
public class CommonService {

	
	private static final Logger log = LoggerFactory.getLogger(CommonService.class);
	
	@Autowired
	private ActivityShareDao activityShareDao;
	
	/**
	 * 微信分享回调
	 */
	public void shareCallBack(Long activityId, String equipId, Long userId){
		
		ActivityShareEntity entity = new ActivityShareEntity();
		entity.setActivityId(activityId);
		entity.setUserId(userId);
		entity.setEquipId(equipId);
		entity.setShareTime(new Date());
		activityShareDao.save(entity);
	}
	
	/**
	 * 本设备今天是否分享过，不区分用户
	 * @return
	 */
	public boolean isEquipIdShareToday(String equipId){
		return false;
	}
	
	/**
	 * 本用户今天是否分享过
	 * @return
	 */
	public boolean isUserIdShareToday(Long userId){
		return false;
	}

}
