package com.gclfax.modules.pact.entity;

import java.io.Serializable;


/**
 * 活动与题目关系表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class ActivityQuestionEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//活动Id
	private Long activityId;
	//问题Id
	private Long questionId;
	//分数
	private Integer score;

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
	 * 设置：问题Id
	 */
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	/**
	 * 获取：问题Id
	 */
	public Long getQuestionId() {
		return questionId;
	}
	/**
	 * 设置：分数
	 */
	public void setScore(Integer score) {
		this.score = score;
	}
	/**
	 * 获取：分数
	 */
	public Integer getScore() {
		return score;
	}
}
