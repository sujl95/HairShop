package com.spring.sample.web.EasysShop.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.spring.sample.web.EasysShop.service.ICService;

@Controller
public class CController {
	@Autowired
	public ICService iCService;
	@Autowired
	public IPagingService iPagingService;
	

	@RequestMapping(value = "customerListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String customerListAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		
		System.out.println(params);
		int cnt = iCService.getcustomerCnt(params);
		 
		
		 PagingBean pb =
		 iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10,
		 5);
		 
		 params.put("startCnt", Integer.toString(pb.getStartCount()));
		 params.put("endCnt", Integer.toString(pb.getEndCount()));
		 
		 
		

		List<HashMap<String, String>> list = iCService.getCustomerlist(params);
		
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "cusDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") // 형태지정
	@ResponseBody
	public String cusDelAjax(@RequestParam HashMap<String, String> params, 
							ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iCService.deleteCus(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "cListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cListAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		 
		List<HashMap<String, String>> list = iCService.getcList(params);
		
		
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
}
