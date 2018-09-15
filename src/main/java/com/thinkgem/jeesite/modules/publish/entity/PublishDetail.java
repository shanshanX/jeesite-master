/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.publish.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.User;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 信息发布Entity
 * @author lycan
 * @version 2018-06-03
 */
public class PublishDetail extends DataEntity<PublishDetail> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String content;		// 内容
	private String picture;		// 相关图片
	private String receiveUserId;		// 专业人员id
	private String receiveUserName;		// 专业人员姓名
	private String createByUserName;		// 受助人姓名
	private String reviewFlag;		// 审核标记（0通过，1未通过，2待审核）
	private String receiveFlag;		// 接受标记（0已接受，1未接受）
	private String completeFlag;		// 完成标记（0完成，1未完成）
	
	public PublishDetail() {
		super();
	}

	public PublishDetail(String id){
		super(id);
	}

	@Length(min=1, max=255, message="标题长度必须介于 1 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=500, message="内容长度必须介于 1 和 500 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=600, message="相关图片长度必须介于 0 和 600 之间")
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	@Length(min=0, max=64, message="专业人员id长度必须介于 0 和 64 之间")
	public String getReceiveUserId() {
		return receiveUserId;
	}

	public void setReceiveUserId(String receiveUserId) {
		this.receiveUserId = receiveUserId;
	}
	
	@Length(min=0, max=100, message="专业人员姓名长度必须介于 0 和 100 之间")
	public String getReceiveUserName() {
		return receiveUserName;
	}

	public void setReceiveUserName(String receiveUserName) {
		this.receiveUserName = receiveUserName;
	}
	
	public String getCreateByUserName() {
		return createByUserName;
	}

	public void setCreateByUserName(String createByUserName) {
		this.createByUserName = createByUserName;
	}
	
	@Length(min=0, max=1, message="审核标记（0通过，1未通过，2待审核）长度必须介于 0 和 1 之间")
	public String getReviewFlag() {
		return reviewFlag;
	}

	public void setReviewFlag(String reviewFlag) {
		this.reviewFlag = reviewFlag;
	}
	
	@Length(min=0, max=1, message="接受标记（0已接受，1未接受）长度必须介于 0 和 1 之间")
	public String getReceiveFlag() {
		return receiveFlag;
	}

	public void setReceiveFlag(String receiveFlag) {
		this.receiveFlag = receiveFlag;
	}
	
	@Length(min=0, max=1, message="完成标记（0完成，1未完成）长度必须介于 0 和 1 之间")
	public String getCompleteFlag() {
		return completeFlag;
	}

	public void setCompleteFlag(String completeFlag) {
		this.completeFlag = completeFlag;
	}
	
}