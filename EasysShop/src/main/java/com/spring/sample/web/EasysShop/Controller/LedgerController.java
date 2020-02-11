package com.spring.sample.web.EasysShop.Controller;

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
import com.spring.sample.web.EasysShop.service.ILedgerService;


@Controller
public class LedgerController {
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public ILedgerService iLedgerService;
	
	@RequestMapping(value = {"/ledgerManage"})
	public ModelAndView ledgerManage(ModelAndView mav) {
		mav.setViewName("EasysShop/ledgerManage");
		return mav;
	}
	
	@RequestMapping(value = {"/releaseManage"})
	public ModelAndView releaseManage(ModelAndView mav) {
		mav.setViewName("EasysShop/releaseManage");
		return mav;
	}
	
	@RequestMapping(value = {"/stockManage"})
	public ModelAndView stockManage(ModelAndView mav) {
		mav.setViewName("EasysShop/stockManage");
		return mav;
	}
	
	@RequestMapping(value = "/warehousingManage")
	public ModelAndView warehousingManage(ModelAndView mav) {
		mav.setViewName("EasysShop/warehousingManage");
		return mav;
	}
	
	//----------------------------------------ledgerManage.jsp----------------------------------------------------
	@RequestMapping(value = "/ledgerLoadAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ledgerLoadAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iLedgerService.ledgerList(params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	//----------------------------------------ledgerManage.jsp end----------------------------------------------------
	
	//----------------------------------------warehousingManage.jsp----------------------------------------------------
	
	//입고 리스트, 페이징
	@RequestMapping(value = "/warehousingListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String warehousingListAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iLedgerService.warehousingListCnt(params);
		
		if(params.get("whs_list_cnt") == null) {
			params.put("whs_list_cnt", "10");
		}
		
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, Integer.parseInt(params.get("whs_list_cnt")), 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iLedgerService.warehousingList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//입고 삭제
	@RequestMapping(value = "/warehousingDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String warehousingDelAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			
			iLedgerService.warehousingDel(params);
			
			modelMap.put("res", "SUCCESS");
			
		}catch(Exception e) {
			e.printStackTrace();
			
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	//----------------------------------------warehousingManage.jsp end----------------------------------------------------
	
}
