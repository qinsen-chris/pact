package com.gclfax.modules.pact.entity;

import java.io.Serializable;


/**
 * 活动详细表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class ActivityInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//活动ID
	private Long activityId;
	//免费参与次数

	private Integer freePartNum;
	//微信分享增加次数

	private Integer shareAddNum;
	//最大参与次数

	private Integer maxPartNum;
	//最小奖励鑫币数量

	private Integer minXinbi;
	//最大奖励鑫币数量

	private Integer maxXinbi;
	//最小奖励奖励金数量

	private Integer minBounty;
	//最大奖励奖励金数量

	private Integer maxBounty;

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
	 * 设置：活动ID
	 */
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	/**
	 * 获取：活动ID
	 */
	public Long getActivityId() {
		return activityId;
	}
	/**
	 * 设置：免费参与次数

	 */
	public void setFreePartNum(Integer freePartNum) {
		this.freePartNum = freePartNum;
	}
	/**
	 * 获取：免费参与次数

	 */
	public Integer getFreePartNum() {
		return freePartNum;
	}
	/**
	 * 设置：微信分享增加次数

	 */
	public void setShareAddNum(Integer shareAddNum) {
		this.shareAddNum = shareAddNum;
	}
	/**
	 * 获取：微信分享增加次数

	 */
	public Integer getShareAddNum() {
		return shareAddNum;
	}
	/**
	 * 设置：最大参与次数

	 */
	public void setMaxPartNum(Integer maxPartNum) {
		this.maxPartNum = maxPartNum;
	}
	/**
	 * 获取：最大参与次数

	 */
	public Integer getMaxPartNum() {
		return maxPartNum;
	}
	/**
	 * 设置：最小奖励鑫币数量

	 */
	public void setMinXinbi(Integer minXinbi) {
		this.minXinbi = minXinbi;
	}
	/**
	 * 获取：最小奖励鑫币数量

	 */
	public Integer getMinXinbi() {
		return minXinbi;
	}
	/**
	 * 设置：最大奖励鑫币数量

	 */
	public void setMaxXinbi(Integer maxXinbi) {
		this.maxXinbi = maxXinbi;
	}
	/**
	 * 获取：最大奖励鑫币数量

	 */
	public Integer getMaxXinbi() {
		return maxXinbi;
	}
	/**
	 * 设置：最小奖励奖励金数量

	 */
	public void setMinBounty(Integer minBounty) {
		this.minBounty = minBounty;
	}
	/**
	 * 获取：最小奖励奖励金数量

	 */
	public Integer getMinBounty() {
		return minBounty;
	}
	/**
	 * 设置：最大奖励奖励金数量

	 */
	public void setMaxBounty(Integer maxBounty) {
		this.maxBounty = maxBounty;
	}
	/**
	 * 获取：最大奖励奖励金数量

	 */
	public Integer getMaxBounty() {
		return maxBounty;
	}
}
