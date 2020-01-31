package com.spring.sample.web.common.Controller;

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
import com.spring.sample.util.Utils;
import com.spring.sample.web.common.service.ICommonService;

@Controller
public class CommonController {
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value = "/commonLeftMenuAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commonLeftMenuAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
//		params.put("authorNo", String.valueOf(session.getAttribute("sAuthorNo")));
//		params.put("departDiv", String.valueOf(session.getAttribute("sDepartDiv")));
		
		List<HashMap<String, String>> leftMenu = iCommonService.getLeftMenu(params);
		
		modelMap.put("leftMenu", leftMenu);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping({ "/login", "/" })
	public ModelAndView commonLogin(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sMemNo") != null) {
			mav.setViewName("redirect:contentsTest");
		} else {
			mav.setViewName("common/login");
		}

		return mav;
	}
	
	@RequestMapping(value = "/loginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commonLoginAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			//패스워드 암호화
			params.put("pw", Utils.encryptAES128(params.get("pw")));
			
			HashMap<String, String> data = iCommonService.loginCheck(params);
			
			if(data != null && !data.isEmpty()) {
				session.setAttribute("sMemNo", data.get("MEM_NO"));
//				session.setAttribute("sEmpName", data.get("EMP_NAME"));
//				session.setAttribute("sAuthorNo", data.get("AUTHOR_NO"));
//				session.setAttribute("sDepartDiv", data.get("DEPART_DIV"));
//				session.setAttribute("sTeamNo", data.get("TEAM_NO"));
//				session.setAttribute("sTeamName", data.get("TEAM_NAME"));
//				session.setAttribute("sEmpPosiName", data.get("EMP_POSI_NAME"));
				
				modelMap.put("res", "SUCCESS");
			} else {
				modelMap.put("res", "FAILED");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "ERROR");
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/logout")
	public ModelAndView commonLogout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		
		mav.setViewName("redirect:login");

		return mav;
	}
	
	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("common/join");
		
		return mav;
	}
	
	@RequestMapping(value = "/header")
	public ModelAndView header(ModelAndView mav) {
		mav.setViewName("common/header");
		
		return mav;
	}
	
	@RequestMapping(value = "/topLeft")
	public ModelAndView topLeft(ModelAndView mav) {
		mav.setViewName("common/topLeft");
		
		return mav;
	}
	
	@RequestMapping(value = "/bottom")
	public ModelAndView bottom(ModelAndView mav) {
		mav.setViewName("common/bottom");
		
		return mav;
	}
	
	@RequestMapping(value = "/pop")
	public ModelAndView popup(ModelAndView mav) {
		mav.setViewName("common/pop");
		
		return mav;
	}
	
	@RequestMapping(value = "/calendar1")
	public ModelAndView calendar(ModelAndView mav) {
		mav.setViewName("common/calendar1");
		
		return mav;
	}
	
	@RequestMapping({"/contentsTest"})
	public ModelAndView contentsTest(HttpSession session, ModelAndView mav) {
		mav.setViewName("common/contents");

		return mav;
	}
}
