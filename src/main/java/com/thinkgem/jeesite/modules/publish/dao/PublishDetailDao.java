/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.publish.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.publish.entity.PublishDetail;

/**
 * 信息发布DAO接口
 * @author lycan
 * @version 2018-06-03
 */
@MyBatisDao
public interface PublishDetailDao extends CrudDao<PublishDetail> {
	
}