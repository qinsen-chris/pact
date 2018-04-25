package com.gclfax.modules.pact.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户分享活动记录表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class ActivityShareEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//活动Id
	private Long activityId;
	//设备唯一标识（微信则是openID）
	private String equipId;
	//用户ID
	private Long userId;
	//分享时间
	private Date shareTime;

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：活动Id
	 */
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	/**
	 * 获取：活动Id
	 */
	public Long getActivityId() {
		return activityId;
	}
	/**
	 * 设置：设备唯一标识（微信则是openID）
	 */
	public void setEquipId(String equipId) {
		this.equipId = equipId;
	}
	/**
	 * 获取：设备唯一标识（微信则是openID）
	 */
	public String getEquipId() {
		return equipId;
	}
	/**
	 * 设置：用户ID
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：用户ID
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：分享时间
	 */
	public void setShareTime(Date shareTime) {
		this.shareTime = shareTime;
	}
	/**
	 * 获取：分享时间
	 */
	public Date getShareTime() {
		return shareTime;
	}
}
