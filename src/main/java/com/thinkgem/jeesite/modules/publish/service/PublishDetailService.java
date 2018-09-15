/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.publish.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.publish.entity.PublishDetail;
import com.thinkgem.jeesite.modules.publish.dao.PublishDetailDao;

/**
 * 信息发布Service
 * @author lycan
 * @version 2018-06-03
 */
@Service
@Transactional(readOnly = true)
public class PublishDetailService extends CrudService<PublishDetailDao, PublishDetail> {

	public PublishDetail get(String id) {
		return super.get(id);
	}
	
	public List<PublishDetail> findList(PublishDetail publishDetail) {
		return super.findList(publishDetail);
	}
	
	public Page<PublishDetail> findPage(Page<PublishDetail> page, PublishDetail publishDetail) {
		return super.findPage(page, publishDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(PublishDetail publishDetail) {
		super.save(publishDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(PublishDetail publishDetail) {
		super.delete(publishDetail);
	}
	
}