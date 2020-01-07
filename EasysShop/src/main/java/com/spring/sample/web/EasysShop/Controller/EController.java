package com.spring.sample.web.EasysShop.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sample.common.service.IPagingService;
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
	
	@RequestMapping(value =  "/sampleJHJ")
	public ModelAndView sampleJHJ(ModelAndView mav) {
		mav.setViewName("EasysShop/sampleJHJ");
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
	
	
	@RequestMapping(value = {"/popupsample"})
	public ModelAndView popupsample(ModelAndView mav) {
		mav.setViewName("EasysShop/popupsample");
		return mav;
	}
	@RequestMapping(value = {"/customer"})
	public ModelAndView customer(ModelAndView mav) {
		mav.setViewName("EasysShop/customer");
		return mav;
	}
	
	@RequestMapping(value = {"/proc_admin_list"})
	public ModelAndView proc_admin_list(ModelAndView mav) {
		mav.setViewName("EasysShop/proc_admin_list");
		return mav;
	}
	
	@RequestMapping(value = {"/popuptest"})
	public ModelAndView popuptest(ModelAndView mav) {
		mav.setViewName("EasysShop/popuptest");
		return mav;
	}
	
	@RequestMapping(value = {"/product_sell_list"})
	public ModelAndView product_sell_list(ModelAndView mav) {
		mav.setViewName("EasysShop/product_sell_list");
		return mav;
	}
	
	
}
