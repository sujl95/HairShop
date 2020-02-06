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
import com.spring.sample.web.EasysShop.service.IScheService;

@Controller
public class ScheController {
	
	@Autowired
	public IScheService iScheService;
	
	@Autowired
	public IPagingService iPagingService;
	
//	예약 & 일정 리스트 불러오기
	@RequestMapping(value = "/getreslistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getreslistAjax(@RequestParam HashMap<String, String> params, HttpSession session,ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<HashMap<String, String>> plan = iScheService.getreslist(params);
		modelMap.put("plan",Utils.toLowerListMapKey(plan));
		
		List<HashMap<String, String>> sche = iScheService.getschelist(params);
		modelMap.put("sche",Utils.toLowerListMapKey(sche));
		
		return mapper.writeValueAsString(modelMap);
	}
	
//	예약 등록
	@RequestMapping(value = "/reserAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reserAddAjax(@RequestParam HashMap<String, String> params, HttpSession session,ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			
			iScheService.reserinsertData(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
//	일정 등록
	@RequestMapping(value = "/scheAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheAddAjax(@RequestParam HashMap<String, String> params, HttpSession session,ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iScheService.scheinsertData(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
//	----------------월간 예약 목록 시작----------------
//	월간 예약 목록
	@RequestMapping(value = {"/reservation_list"})
	public ModelAndView reservation_list(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) {
		if(params.get("page") == null) {
			params.put("page", "1");
		}
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("EasysShop/reservation_list");
		return mav;
	}
	
//  월간 예약 목록 가져오기
	@RequestMapping(value="/getreservationlistAjax", 
			method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getreservationlistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println("params="+params);
		
		int cnt = iScheService.getreservationCnt(params);
		if(params.get("pg_cnt") == null) {
			params.put("pg_cnt", "10");
		}
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, Integer.parseInt(params.get("pg_cnt")), 5);
//		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10,5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iScheService.getreservationList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		return mapper.writeValueAsString(modelMap);
	}
	
//	월간 예약 수정 데이터가져오기
	@RequestMapping(value = "/getresdataAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String getresdataAjax(@RequestParam HashMap<String, String>params,HttpSession session, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String, String> data = iScheService.getresdata(params);
		
		modelMap.put("data",data);
		return mapper.writeValueAsString(modelMap);
	}
	
//	월간 예약 수정
	@RequestMapping(value = "/resUpdateAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String resUpdateAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			iScheService.resupdateData(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
//	월간 예약 삭제 Delete
	@RequestMapping(value="/resdelAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String resdelAjax(@RequestParam HashMap<String, String> params, @RequestParam("res_check") List<String> res_check, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			for(int i = 0 ; i < res_check.size(); i++) {
				params.put("res_no",res_check.get(i));
				iScheService.resdeleteData(params);
			}
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}

//	----------------월간 예약 목록 끝----------------
//	----------------월간 일정 목록 시작----------------	
	
//	월간 예약 목록
	@RequestMapping(value = {"/calendar_list"})
	public ModelAndView calendar_list(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) {
		if(params.get("page") == null) {
			params.put("page", "1");
		}
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("EasysShop/calendar_list");
		return mav;
	}
	
//  월간 예약 목록 가져오기
	@RequestMapping(value="/getcalendarlistAjax", 
			method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getcalendarlistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println("params="+params);
		
		int cnt = iScheService.getcalendarCnt(params);
		if(params.get("pg_cnt") == null) {
			params.put("pg_cnt", "10");
		}
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, Integer.parseInt(params.get("pg_cnt")), 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iScheService.getcalendarList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		return mapper.writeValueAsString(modelMap);
	}
	
//	월간 예약 수정 데이터가져오기
	@RequestMapping(value = "/getcaldataAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String getcaldataAjax(@RequestParam HashMap<String, String>params,HttpSession session, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String, String> data = iScheService.getcaldata(params);
		
		modelMap.put("data",data);
		return mapper.writeValueAsString(modelMap);
	}
	
//	월간 예약 수정
	@RequestMapping(value = "/calUpdateAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String calUpdateAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			iScheService.calupdateData(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
//	월간 예약 삭제 Delete
	@RequestMapping(value="/caldelAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String caldelAjax(@RequestParam HashMap<String, String> params, @RequestParam("cal_check") List<String> cal_check, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			for(int i = 0 ; i < cal_check.size(); i++) {
				params.put("cal_no",cal_check.get(i));
				iScheService.caldeleteData(params);
			}
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}

}
