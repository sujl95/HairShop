package com.spring.sample.web.EasysShop.Controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.sample.common.bean.PagingBean;
import com.spring.sample.common.service.IPagingService;
import com.spring.sample.util.Utils;
import com.spring.sample.web.EasysShop.service.IProcService;

@Controller
public class ProcController {
	
	@Autowired
	public IProcService iProcService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = {"/proc_admin_list"})
	public ModelAndView proc_admin_list(ModelAndView mav) {
		mav.setViewName("EasysShop/proc_admin_list");
		return mav;
	}
	
	@RequestMapping(value = "/procListAjax",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String procListAjax(@RequestParam HashMap<String,String> params,
					ModelAndView mav, HttpSession session) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String,Object> modelMap = new HashMap<String,Object>();
	
	List<HashMap<String, String>> list = iProcService.getProcList(params);
	
	modelMap.put("list", list);
	return mapper.writeValueAsString(modelMap);
}
	
}
