package com.spring.sample.web.EasysShop.Controller;

import java.util.ArrayList;
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
import com.spring.sample.web.EasysShop.service.IEService;

@Controller
public class EController {
	@Autowired
	public IEService iEService;
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = {"/sample","/sample1"})
	public ModelAndView sample(ModelAndView mav) {
		mav.setViewName("EasysShop/sample");
		return mav;
	}
	
	@RequestMapping(value =  "/sample2")
	public ModelAndView sample2(ModelAndView mav) {
		mav.setViewName("EasysShop/sample2");
		return mav;
	}
	
	@RequestMapping(value =  "/staffManage")
	public ModelAndView sampleJHJ(ModelAndView mav) {
		mav.setViewName("EasysShop/staffManage");
		return mav;
	}
	
	@RequestMapping(value =  "/dlManage")
	public ModelAndView dlManage(ModelAndView mav) {
		mav.setViewName("EasysShop/dlManage");
		return mav;
	}
	
	@RequestMapping(value = {"/schedule_calendar_list"})
	public ModelAndView schedule_calendar_list(ModelAndView mav) {
		mav.setViewName("EasysShop/schedule_calendar_list");
		return mav;
	}
	
	@RequestMapping(value = {"/schedule_reservation_list"})
	public ModelAndView schedule_reservation_list(ModelAndView mav) {
		mav.setViewName("EasysShop/schedule_reservation_list");
		return mav;
	}
	@RequestMapping(value = {"/schedule_main_list"})
	public ModelAndView schedule_main_list(ModelAndView mav) {
		mav.setViewName("EasysShop/schedule_main_list");
		return mav;
	}
	@RequestMapping(value = {"/schedule_fullcalendar"})
	public ModelAndView schedule_fullcalendar(ModelAndView mav) {
		mav.setViewName("EasysShop/schedule_fullcalendar");
		return mav;
	}
		
	@RequestMapping(value = {"/schedule_fullcalendar1"})
	public ModelAndView schedule_fullcalendar1(ModelAndView mav) {
		mav.setViewName("EasysShop/schedule_fullcalendar1");
		return mav;
	}
	
	@RequestMapping(value = {"/schedule_fullcalendar2"})
	public ModelAndView schedule_fullcalendar2(ModelAndView mav) {
		mav.setViewName("EasysShop/schedule_fullcalendar2");
		return mav;
	}
	
	@RequestMapping(value = {"/schedule_fullcalendar3"})
	public ModelAndView schedule_fullcalendar3(ModelAndView mav) {
		mav.setViewName("EasysShop/schedule_fullcalendar3");
		return mav;
	}
	
	@RequestMapping(value = {"/popupsample"})
	public ModelAndView popupsample(ModelAndView mav) {
		mav.setViewName("EasysShop/popupsample");
		return mav;
	}
	@RequestMapping(value = {"/customerList"})
	public ModelAndView customerList(ModelAndView mav) {
		mav.setViewName("EasysShop/customerList");
		return mav;
	}
	
	@RequestMapping(value = {"/popuptest"})
	public ModelAndView popuptest(ModelAndView mav) {
		mav.setViewName("EasysShop/popuptest");
		return mav;
	}
	
	@RequestMapping(value = {"/popuptest2"})
	public ModelAndView popuptest2(ModelAndView mav) {
		mav.setViewName("EasysShop/popuptest2");
		return mav;
	}
	
	

//	----------------------------------팝업시작--------------------------------
//	고객 등급 코드 코드 리스트 가져오기
	@RequestMapping(value="/getcustgradelistAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getcustgradelistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<HashMap<String, String>> list = iEService.getcustgradeList(params);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
//	고객 등급 코드 데이터 가져오기
	@RequestMapping(value = "/getcustgdataAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String getcustgdataAjax(@RequestParam HashMap<String, String>params,HttpSession session, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String, String> data = iEService.getcustgradedata(params);
		
		modelMap.put("data",data);
		return mapper.writeValueAsString(modelMap);
	}
//	고객 등급 등록 
	@RequestMapping(value = "/custcodeAddAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String custcodeAddAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			iEService.custcodeAdd(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}

//	고객 등급 수정
	@RequestMapping(value = "/custcodeUpdateAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String custcodeUpdateAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			iEService.custcodeUpdate(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}

//	고객 등급 삭제 
	@RequestMapping(value="/custgradedelAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String custgradedelAjax(@RequestParam HashMap<String, String> params, @RequestParam("pop_check") List<String> pop_check, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			for(int i = 0 ; i < pop_check.size(); i++) {
				params.put("cust_g_no",pop_check.get(i));
				iEService.custgradedel(params);
			}
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}
	
//	직원 등급 코드 코드 리스트 가져오기
	@RequestMapping(value="/getempgradelistAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getempgradelistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<HashMap<String, String>> list = iEService.getempgradeList(params);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
//	직원 등급 코드 데이터 가져오기
	@RequestMapping(value = "/getempgdataAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String getempgdataAjax(@RequestParam HashMap<String, String>params,HttpSession session, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String, String> data = iEService.getempgradedata(params);
		
		modelMap.put("data",data);
		return mapper.writeValueAsString(modelMap);
	}
//	직원 등급 등록 
	@RequestMapping(value = "/empcodeAddAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String empcodeAddAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			iEService.empcodeAdd(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
//	직원 등급 수정
	@RequestMapping(value = "/empcodeUpdateAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String empcodeUpdateAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			iEService.empcodeUpdate(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
//	직원 등급 삭제 
	@RequestMapping(value="/empgradedelAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String empgradedelAjax(@RequestParam HashMap<String, String> params, @RequestParam("pop_check") List<String> pop_check, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println("param"+params);
		String res = "";
		try {
			for(int i = 0 ; i < pop_check.size(); i++) {
				params.put("emp_g_no",pop_check.get(i));
				iEService.empgradedel(params);
			}
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}
	

//	거래처 코드 리스트 가져오기
	@RequestMapping(value="/getcomplistAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getcomplistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<HashMap<String, String>> list = iEService.getcompcodeList(params);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
//	거래처 데이터 가져오기
	@RequestMapping(value = "/getcompdataAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String getcompdataAjax(@RequestParam HashMap<String, String>params,HttpSession session, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String, String> data = iEService.getcompdata(params);
		
		modelMap.put("data",data);
		return mapper.writeValueAsString(modelMap);
	}
//	거래처 등록 
	@RequestMapping(value = "/compcodeAddAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String compcodeAddAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			iEService.compcodeAdd(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
//	거래처 수정
	@RequestMapping(value = "/compcodeUpdateAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String compcodeUpdateAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			System.out.println("params"+params);
			iEService.compcodeUpdate(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
//	거래처 삭제 
	@RequestMapping(value="/compdelAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String compdelAjax(@RequestParam HashMap<String, String> params, @RequestParam("pop_check") List<String> pop_check, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println("param"+params);
		String res = "";
		try {
			for(int i = 0 ; i < pop_check.size(); i++) {
				params.put("comp_no",pop_check.get(i));
				iEService.compdel(params);
			}
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}
	
//	상품 코드 리스트 가져오기
	@RequestMapping(value="/getitemcodelistAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getitemcodelistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<HashMap<String, String>> list = iEService.getitemcodeList(params);
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
//	상품 데이터 가져오기
	@RequestMapping(value = "/getitemcodedataAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String getitemcodedataAjax(@RequestParam HashMap<String, String>params,HttpSession session, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String, String> data = iEService.getitemcodedata(params);
		
		modelMap.put("data",data);
		return mapper.writeValueAsString(modelMap);
	}
//	상품 등록 
	@RequestMapping(value = "/itemcodeAddAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String itemcodeAddAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		System.out.println("params" + params);
		try {
			iEService.itemcodeAdd(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
//	상품 수정
	@RequestMapping(value = "/itemcodeUpdateAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String itemcodeUpdateAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			iEService.itemcodeUpdate(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
//	상품 삭제 
	@RequestMapping(value="/itemdelAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String itemdelAjax(@RequestParam HashMap<String, String> params, @RequestParam("pop_check") List<String> pop_check, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			for(int i = 0 ; i < pop_check.size(); i++) {
				params.put("IT_CODE_NO",pop_check.get(i));
				iEService.itemcodedel(params);
			}
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}
	
//	상품 카데고리 가져오기
	@RequestMapping(value="/getitemcateAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getitemcateAjax(@RequestParam HashMap<String, String> params, ModelAndView mav, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<HashMap<String, String>> Mlist = iEService.getitemcateList(params);
		modelMap.put("Mlist", Mlist);
		if(params.get("NOW_M_CATE") != null) {
			params.put("IT_M_GROUP_NO", params.get("NOW_M_CATE"));			
		}
		if(!params.get("IT_M_GROUP_NO").equals("-1")) {
			List<HashMap<String, String>> Slist = iEService.getitemScateList(params);
			modelMap.put("Slist", Slist);
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
	
	
	
	
	
	
}
