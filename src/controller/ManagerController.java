package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import po.Manager;
import po.Pagination;
import service.ManagerService;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/managerLogin1")
	public String managerLogin(Manager manager,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		List<Manager> list = managerService.checkManager(manager);
		if(list.size() >0) {
			Manager manager2 = list.get(0);
			session.setAttribute("managerName", manager2.getName());
			session.setAttribute("managerAuthority", manager2.getAuthority());
			return "redirect:/jsp/managerIndex.jsp";
		}else {
			request.setAttribute("msg", "对不起，帐号或密码错误！");
			return "/managerLogin";
		}
	}
	
	@RequestMapping("/managerLogout1")
	public String managerLogout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:jsp/managerLogin.jsp";
	}
	
	@RequestMapping("/managerGetList1")
	public @ResponseBody Map<String, Object> managerGetList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<Manager> list = managerService.getList();
		List<Manager> list2 = managerService.getListByLimit(pagination);
		int total = list.size();
		map.put("rows", list2);
		map.put("total", total);
		return map;
	}
	
	@RequestMapping("/managerAdd1")
	public @ResponseBody String managerAdd(Manager manager) throws Exception{
		managerService.addOne(manager);
		return "success";
	}
	
	@RequestMapping("/managerDelete1")
	public @ResponseBody String managerDelete(@RequestBody String idsStr) throws Exception{
		String[] ids = idsStr.split(",");
		for (int i = 0; i < ids.length; i++) {
			managerService.deleteOne(Integer.parseInt(ids[i]));
		}
		return "success";
	}
	
	@RequestMapping("/managerUpdate1")
	public @ResponseBody String managerUpdate(Manager manager) throws Exception{
		managerService.updateOne(manager);
		return "success";
	}
	
	@RequestMapping("/toGetList")
	public ModelAndView getList(HttpSession session) throws Exception{
		ModelAndView model = new ModelAndView();
		String managerName = (String) session.getAttribute("managerName");
		Manager manager = managerService.findOne(managerName);
		model.setViewName("/updateManager");
		model.addObject("managerId", manager.getId());
		System.out.println(manager.getId());
		return model;
	}
	
	@RequestMapping("/getManagerList")
	public @ResponseBody Manager getList(Integer id) throws Exception{
		return managerService.findOneById(id);
	}
}
