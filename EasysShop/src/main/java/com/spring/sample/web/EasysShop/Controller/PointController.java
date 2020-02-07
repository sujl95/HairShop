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
import com.spring.sample.web.EasysShop.service.IPointService;
import com.spring.sample.web.EasysShop.service.IProcService;

@Controller
public class PointController {
	
	@Autowired
	public IPointService iPointService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = {"/point_list"})
	public ModelAndView point_list(ModelAndView mav) {
		mav.setViewName("EasysShop/point_list");
		return mav;
	}
	
	@RequestMapping(value = "/pointListAjax",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String pointListAjax(@RequestParam HashMap<String,String> params,
					ModelAndView mav, HttpSession session) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String,Object> modelMap = new HashMap<String,Object>();
	
	List<HashMap<String, String>> list = iPointService.getPointList(params);
	
	modelMap.put("list", list);
	return mapper.writeValueAsString(modelMap);
}
	
}
