/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.publish.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.thinkgem.jeesite.modules.publish.entity.PublishDetail;
import com.thinkgem.jeesite.modules.publish.service.PublishDetailService;

/**
 * 信息发布Controller
 * @author lycan
 * @version 2018-06-03
 */
@Controller
@RequestMapping(value = "${adminPath}/publish/publishDetail")
public class PublishDetailController extends BaseController {

	@Autowired
	private PublishDetailService publishDetailService;
	
	@ModelAttribute
	public PublishDetail get(@RequestParam(required=false) String id) {
		PublishDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = publishDetailService.get(id);
		}
		if (entity == null){
			entity = new PublishDetail();
		}
		return entity;
	}
	
	@RequiresPermissions("publish:publishDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(PublishDetail publishDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		publishDetail.setCreateBy(user);
		Page<PublishDetail> page = publishDetailService.findPage(new Page<PublishDetail>(request, response), publishDetail);
		model.addAttribute("page", page);
		return "modules/publish/publishDetailList";
	}

	@RequiresPermissions("publish:publishDetail:view")
	@RequestMapping(value = "form")
	public String form(PublishDetail publishDetail, Model model) {
		model.addAttribute("publishDetail", publishDetail);
		return "modules/publish/publishDetailForm";
	}

	@RequiresPermissions("publish:publishDetail:edit")
	@RequestMapping(value = "save")
	public String save(PublishDetail publishDetail, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, publishDetail)){
			return form(publishDetail, model);
		}
		if(publishDetail.getCreateByUserName() == null || publishDetail.getCreateByUserName() == "") {
			User user = UserUtils.getUser();
			publishDetail.setCreateByUserName(user.getName());
			publishDetail.setReviewFlag("2");
			publishDetail.setReceiveFlag("1");
			publishDetail.setCompleteFlag("1");
		}
		publishDetail.setReviewFlag("2");
		publishDetailService.save(publishDetail);
		addMessage(redirectAttributes, "保存信息发布成功");
		return "redirect:"+Global.getAdminPath()+"/publish/publishDetail/?repage";
	}
	
	@RequiresPermissions("publish:publishDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(PublishDetail publishDetail, RedirectAttributes redirectAttributes) {
		publishDetailService.delete(publishDetail);
		addMessage(redirectAttributes, "删除信息发布成功");
		return "redirect:"+Global.getAdminPath()+"/publish/publishDetail/?repage";
	}

	@RequiresPermissions("publish:publishDetail:edit")
	@RequestMapping(value = "examineAndVerify")
	public String examineAndVerify(PublishDetail publishDetail,HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PublishDetail> page = publishDetailService.findPage(new Page<PublishDetail>(request, response), publishDetail);
		model.addAttribute("page", page);
		return "modules/publish/publishExamine";
	}

	@RequiresPermissions("publish:publishDetail:view")
	@RequestMapping(value = "info")
	public String info(PublishDetail publishDetail,HttpServletRequest request, HttpServletResponse response, Model model) {

//		Page<PublishDetail> page = publishDetailService.findPage(new Page<PublishDetail>(request, response), publishDetail);
//		for(PublishDetail pd : page.getList()){
//			String old = pd.getPicture();
//			String newPictureUrl = old.substring(old.indexOf("|")+1,old.length());
//			pd.setPicture(newPictureUrl);
//		}
		String str = publishDetail.getPicture();
		Integer a = str.indexOf("|");
		Integer b = str.length();
		String pictureUrl = str.substring(str.indexOf("|")+1,str.length());
		model.addAttribute("pictureUrl", pictureUrl);
		model.addAttribute("publishDetail", publishDetail);
		return "modules/publish/publishDetailInfo";
	}

	@RequiresPermissions("publish:publishDetail:view")
	@RequestMapping(value = "passInfo")
	public String passInfo(PublishDetail publishDetail,String btnSubmit,HttpServletRequest request, HttpServletResponse response, Model model) {
		if(btnSubmit != null && btnSubmit !=""){
			publishDetail.setReviewFlag("0");
		}else{
			publishDetail.setReviewFlag("1");
		}

		publishDetailService.save(publishDetail);
		return "redirect:"+Global.getAdminPath()+"/publish/publishDetail/examineAndVerify";
	}
}