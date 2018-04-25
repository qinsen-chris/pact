package com.gclfax.modules.pact.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户获奖记录表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class UserAwardsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//活动Id
	private Long activityId;
	//设备唯一标识（微信则是openID）
	private String equipId;
	//用户ID
	private Long userId;
	//答题ID
	private Long answerId;
	//增加奖励金数量
	private Integer partBounty;
	//增加奖励金数量
	private Integer assitBounty;
	//是否已经领奖 1是；0否
	private Boolean isAccept;
	//
	private Date createTime;

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
	 * 设置：答题ID
	 */
	public void setAnswerId(Long answerId) {
		this.answerId = answerId;
	}
	/**
	 * 获取：答题ID
	 */
	public Long getAnswerId() {
		return answerId;
	}
	/**
	 * 设置：增加奖励金数量
	 */
	public void setPartBounty(Integer partBounty) {
		this.partBounty = partBounty;
	}
	/**
	 * 获取：增加奖励金数量
	 */
	public Integer getPartBounty() {
		return partBounty;
	}
	/**
	 * 设置：增加奖励金数量
	 */
	public void setAssitBounty(Integer assitBounty) {
		this.assitBounty = assitBounty;
	}
	/**
	 * 获取：增加奖励金数量
	 */
	public Integer getAssitBounty() {
		return assitBounty;
	}
	/**
	 * 设置：是否已经领奖 1是；0否
	 */
	public void setIsAccept(Boolean isAccept) {
		this.isAccept = isAccept;
	}
	/**
	 * 获取：是否已经领奖 1是；0否
	 */
	public Boolean getIsAccept() {
		return isAccept;
	}
	/**
	 * 设置：
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：
	 */
	public Date getCreateTime() {
		return createTime;
	}
}
