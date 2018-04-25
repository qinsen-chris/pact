package com.gclfax.modules.pact.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户答题记录表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class AnswerRecordsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//活动Id
	private Long activityId;
	//设备唯一标识（微信则是openID）
	private String equipId;
	//用户ID
	private Long userId;
	//答题时间
	private Date answerTime;
	//答题结果
	private Boolean answerResult;
	//获得奖励金数量
	private Integer bountyNum;

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
	 * 设置：答题时间
	 */
	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}
	/**
	 * 获取：答题时间
	 */
	public Date getAnswerTime() {
		return answerTime;
	}
	/**
	 * 设置：答题结果
	 */
	public void setAnswerResult(Boolean answerResult) {
		this.answerResult = answerResult;
	}
	/**
	 * 获取：答题结果
	 */
	public Boolean getAnswerResult() {
		return answerResult;
	}
	/**
	 * 设置：获得奖励金数量
	 */
	public void setBountyNum(Integer bountyNum) {
		this.bountyNum = bountyNum;
	}
	/**
	 * 获取：获得奖励金数量
	 */
	public Integer getBountyNum() {
		return bountyNum;
	}
}
