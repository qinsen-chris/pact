package com.gclfax.modules.pact.entity;

import java.io.Serializable;


/**
 * 问题选项表
 * 
 * @author chenwenjie
 * @email 
 * @date 2018-01-24 17:21:30
 */
public class QuestionOptionsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//问题编号

	private Long questionId;
	//选项内容

	private String content;
	//是否正确
	private Boolean isCorrect;
	//选项排序

	private Integer order;

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
	 * 设置：问题编号

	 */
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	/**
	 * 获取：问题编号

	 */
	public Long getQuestionId() {
		return questionId;
	}
	/**
	 * 设置：选项内容

	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：选项内容

	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：是否正确
	 */
	public void setIsCorrect(Boolean isCorrect) {
		this.isCorrect = isCorrect;
	}
	/**
	 * 获取：是否正确
	 */
	public Boolean getIsCorrect() {
		return isCorrect;
	}
	/**
	 * 设置：选项排序

	 */
	public void setOrder(Integer order) {
		this.order = order;
	}
	/**
	 * 获取：选项排序

	 */
	public Integer getOrder() {
		return order;
	}
}
