/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.task.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.task.entity.TasksDetail;
import com.thinkgem.jeesite.modules.task.dao.TasksDetailDao;

/**
 * 任务Service
 * @author Xieshanshan
 * @version 2018-09-05
 */
@Service
@Transactional(readOnly = true)
public class TasksDetailService extends CrudService<TasksDetailDao, TasksDetail> {

	public TasksDetail get(String id) {
		return super.get(id);
	}

	public List<TasksDetail> findList(TasksDetail tasksDetail) {
		return super.findList(tasksDetail);
	}

	public Page<TasksDetail> findPage(Page<TasksDetail> page, TasksDetail tasksDetail) {
		return super.findPage(page, tasksDetail);
	}

	@Transactional(readOnly = false)
	public void save(TasksDetail tasksDetail) {
		super.save(tasksDetail);
	}

	@Transactional(readOnly = false)
	public void delete(TasksDetail tasksDetail) {
		super.delete(tasksDetail);
	}

}