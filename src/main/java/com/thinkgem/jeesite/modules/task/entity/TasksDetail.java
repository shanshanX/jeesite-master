/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.task.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 任务Entity
 * @author Xieshanshan
 * @version 2018-09-05
 */
public class TasksDetail extends DataEntity<TasksDetail> {

	private static final long serialVersionUID = 1L;
	private String taskId;		// 任务id
	private String taskTitle;  //任务标题
	private String userId;		// 受助人id
	private String userName;		// 受助人姓名
	private String phone;
	private String receiveUserIdRecent;		// 专业人员id
	private String receiveUserNameRecent;		// 专业人员姓名
	private String completeFlag;		// 完成标记（0完成，1未完成）
	private String giveUpFlag;		// 退回任务标记（0接受，1退回）

	public TasksDetail() {
		super();
	}

	public TasksDetail(String id){
		super(id);
	}

	@Length(min=0, max=64, message="任务id长度必须介于 0 和 64 之间")
	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskTitle() {
		return taskTitle;
	}

	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Length(min=0, max=100, message="受助人姓名长度必须介于 0 和 100 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Length(min=0, max=64, message="专业人员id长度必须介于 0 和 64 之间")
	public String getReceiveUserIdRecent() {
		return receiveUserIdRecent;
	}

	public void setReceiveUserIdRecent(String receiveUserIdRecent) {
		this.receiveUserIdRecent = receiveUserIdRecent;
	}

	@Length(min=0, max=100, message="专业人员姓名长度必须介于 0 和 100 之间")
	public String getReceiveUserNameRecent() {
		return receiveUserNameRecent;
	}

	public void setReceiveUserNameRecent(String receiveUserNameRecent) {
		this.receiveUserNameRecent = receiveUserNameRecent;
	}

	@Length(min=0, max=1, message="完成标记（0完成，1未完成）长度必须介于 0 和 1 之间")
	public String getCompleteFlag() {
		return completeFlag;
	}

	public void setCompleteFlag(String completeFlag) {
		this.completeFlag = completeFlag;
	}

	@Length(min=0, max=1, message="退回任务标记（0接受，1退回）长度必须介于 0 和 1 之间")
	public String getGiveUpFlag() {
		return giveUpFlag;
	}

	public void setGiveUpFlag(String giveUpFlag) {
		this.giveUpFlag = giveUpFlag;
	}

}