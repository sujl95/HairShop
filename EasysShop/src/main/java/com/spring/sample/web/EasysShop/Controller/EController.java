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
		
	
	@RequestMapping(value = {"/popupsample"})
	public ModelAndView popupsample(ModelAndView mav) {
		mav.setViewName("EasysShop/popupsample");
		return mav;
	}
	
	@RequestMapping(value = {"/proc_admin_list"})
	public ModelAndView proc_admin_list(ModelAndView mav) {
		mav.setViewName("EasysShop/proc_admin_list");
		return mav;
	}
}
