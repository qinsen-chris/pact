package com.gclfax.modules.pact.entity;

import java.io.Serializable;


/**
 * 问题列表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class QuestionsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//题目内容

	private String content;
	//题目类型1、单选题；2、多选题；3、其他
	private Integer type;
	//状态0，停用；1，启用
	private Boolean status;
	//题目归类1、风险等级评估；2、平台相关；3、趣味问题
	private Integer classify;

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
	 * 设置：题目内容

	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：题目内容

	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：题目类型1、单选题；2、多选题；3、其他
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * 获取：题目类型1、单选题；2、多选题；3、其他
	 */
	public Integer getType() {
		return type;
	}
	/**
	 * 设置：状态0，停用；1，启用
	 */
	public void setStatus(Boolean status) {
		this.status = status;
	}
	/**
	 * 获取：状态0，停用；1，启用
	 */
	public Boolean getStatus() {
		return status;
	}
	/**
	 * 设置：题目归类1、风险等级评估；2、平台相关；3、趣味问题
	 */
	public void setClassify(Integer classify) {
		this.classify = classify;
	}
	/**
	 * 获取：题目归类1、风险等级评估；2、平台相关；3、趣味问题
	 */
	public Integer getClassify() {
		return classify;
	}
}
