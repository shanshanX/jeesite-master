/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.task.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.publish.entity.PublishDetail;
import com.thinkgem.jeesite.modules.publish.service.PublishDetailService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.poi.ss.formula.functions.T;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.xmlbeans.impl.xb.xsdschema.Attribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.config.Task;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.task.entity.TasksDetail;
import com.thinkgem.jeesite.modules.task.service.TasksDetailService;

import java.util.List;

@Controller
@RequestMapping(value = "${adminPath}/task/tasksDetail")
public class TasksDetailController extends BaseController {

	@Autowired
	private TasksDetailService tasksDetailService;

	@Autowired
	private PublishDetailService publishDetailService;

	@Autowired
	private SystemService systemService;

	@ModelAttribute
	public TasksDetail get(@RequestParam(required=false) String id) {
		TasksDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tasksDetailService.get(id);
		}
		if (entity == null){
			entity = new TasksDetail();
		}
		return entity;
	}

	@RequiresPermissions("task:tasksDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(PublishDetail publishDetail,TasksDetail tasksDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		publishDetail.setReviewFlag("0");
		publishDetail.setReceiveFlag("1");
		Page<PublishDetail> reviewSuccessPage = publishDetailService.findPage(new Page<PublishDetail>(request,response),publishDetail);


		model.addAttribute("page", reviewSuccessPage);
		return "modules/task/tasksDetailList";
	}

	@RequiresPermissions("task:tasksDetail:view")
	@RequestMapping(value = "form")
	public String form(TasksDetail tasksDetail, Model model) {
		model.addAttribute("tasksDetail", tasksDetail);
		return "modules/task/tasksDetailForm";
	}

	@RequiresPermissions("task:tasksDetail:edit")
	@RequestMapping(value = "save")
	public String save(TasksDetail tasksDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tasksDetail)){
			return form(tasksDetail, model);
		}
		tasksDetailService.save(tasksDetail);
		addMessage(redirectAttributes, "保存任务成功");
		return "redirect:"+Global.getAdminPath()+"/task/tasksDetail/?repage";
	}

	@RequiresPermissions("task:tasksDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(TasksDetail tasksDetail, RedirectAttributes redirectAttributes) {
		tasksDetailService.delete(tasksDetail);
		addMessage(redirectAttributes, "删除任务成功");
		return "redirect:"+Global.getAdminPath()+"/task/tasksDetail/?repage";
	}

	@RequiresPermissions("task:tasksDetail:edit")
	@RequestMapping(value = "applicationFlag")
	public String applicationFlag(PublishDetail publishDetail, Model model, RedirectAttributes redirectAttributes) {
		TasksDetail tasksDetail = new TasksDetail();
		List<PublishDetail> pd = publishDetailService.findList(publishDetail);
		if (!beanValidator(model, tasksDetail)){
			return form(tasksDetail, model);
		}

		tasksDetail.setTaskId(pd.get(0).getId());
		tasksDetail.setTaskTitle(pd.get(0).getTitle());
		tasksDetail.setUserId(pd.get(0).getCreateBy().getId());
		tasksDetail.setUserName(pd.get(0).getCreateByUserName());

		User receiveUser = UserUtils.getUser();
		tasksDetail.setReceiveUserIdRecent(receiveUser.getId());

		tasksDetail.setReceiveUserNameRecent(receiveUser.getName());
		tasksDetail.setCompleteFlag("1");
		tasksDetail.setGiveUpFlag("0");
		User user = systemService.getUser(pd.get(0).getCreateBy().getId());
		tasksDetail.setPhone(user.getPhone());
		tasksDetailService.save(tasksDetail);

		pd.get(0).setReceiveFlag("0");
		pd.get(0).setReceiveUserId(receiveUser.getId());
		pd.get(0).setReceiveUserName(receiveUser.getName());
		publishDetailService.save(pd.get(0));

		addMessage(redirectAttributes, "保存任务成功");
		return "redirect:"+Global.getAdminPath()+"/task/tasksDetail/?repage";
	}

	@RequiresPermissions("task:tasksDetail:edit")
	@RequestMapping(value = "delApplication")
	public String delApplication(PublishDetail publishDetail,TasksDetail tasksDetail, Model model, RedirectAttributes redirectAttributes) {
		List<TasksDetail> td = tasksDetailService.findList(tasksDetail);
		td.get(0).setGiveUpFlag("1");
		tasksDetailService.save(td.get(0));

		publishDetail.setId(td.get(0).getTaskId());
		List<PublishDetail> pd = publishDetailService.findList(publishDetail);
		pd.get(0).setReceiveUserId("");
		pd.get(0).setReceiveUserName("");
		pd.get(0).setReceiveFlag("1");
		publishDetailService.save(pd.get(0));

		addMessage(redirectAttributes, "退回任务成功");
		return "redirect:"+Global.getAdminPath()+"/task/tasksDetail/?repage";
	}

	@RequiresPermissions("task:tasksDetail:view")
	@RequestMapping(value = "myTasks")
	public String myTasks(PublishDetail publishDetail,TasksDetail tasksDetail, HttpServletRequest request, HttpServletResponse response,Model model, RedirectAttributes redirectAttributes) {
		User user = UserUtils.getUser();
		tasksDetail.setReceiveUserIdRecent(user.getId());
		tasksDetail.setGiveUpFlag("0");
		Page<TasksDetail> myTasksPage = tasksDetailService.findPage(new Page<TasksDetail>(request,response),tasksDetail);
		model.addAttribute("page",myTasksPage);
		return "modules/task/myTasks";
	}

	@RequiresPermissions("publish:publishDetail:view")
	@RequestMapping(value = "info")
	public String info(PublishDetail publishDetail,TasksDetail tasksDetail,HttpServletRequest request, HttpServletResponse response, Model model) {
		publishDetail.setId(tasksDetail.getTaskId());
		List<PublishDetail> pd = publishDetailService.findList(publishDetail);
		String str = pd.get(0).getPicture();
		String pictureUrl = str.substring(str.indexOf("|")+1,str.length());
		model.addAttribute("title",pd.get(0).getTitle());
		model.addAttribute("content",pd.get(0).getContent());
		model.addAttribute("pictureUrl", pictureUrl);
		model.addAttribute("remarkd", pd.get(0).getRemarks());
		return "modules/task/tasksDetailInfo";
	}

	@RequiresPermissions("task:tasksDetail:edit")
	@RequestMapping(value = "tasksSuccess")
	public String tasksSuccess(PublishDetail publishDetail,TasksDetail tasksDetail, Model model, RedirectAttributes redirectAttributes) {
		List<TasksDetail> td = tasksDetailService.findList(tasksDetail);
		td.get(0).setCompleteFlag("0");
		tasksDetailService.save(td.get(0));

		publishDetail.setId(td.get(0).getTaskId());
		List<PublishDetail> pd = publishDetailService.findList(publishDetail);
		pd.get(0).setCompleteFlag("0");
		publishDetailService.save(pd.get(0));

		addMessage(redirectAttributes, "恭喜，完成一项任务！");
		return "redirect:"+Global.getAdminPath()+"/task/tasksDetail/myTasks";
	}

}