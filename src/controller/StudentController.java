package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import po.Pagination;
import po.Student;
import service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/login2")
	public String login(String name,String password,HttpSession session,HttpServletRequest request) throws Exception{
		Student student = studentService.checkLoginByNameAndPass(name, password);
		if(student != null) {
			session.setAttribute("studentName", student.getName());
			return "redirect:/jsp/index.jsp";
		}else {
			request.setAttribute("msg", "账号密码有误请重新输入");
			return "/login";
		}
	}
	
	@RequestMapping("/checkLogin")
	public String checklogin(Student student) throws Exception{
		return "/login";
	}
	
	@RequestMapping("/toSignIn1")
	public String toSignIn() throws Exception{
		return "signIn";
	}
	
	@RequestMapping("/checkSignIn")
	public @ResponseBody boolean checkRegister(String name) throws Exception{
		Student student = studentService.checkSignIn(name);
		if(student != null) {
			return false;
		}else {
		
		return true;
		}
	}
	
	@RequestMapping("/signIn1")
	public String signIn(Student student) throws Exception{
		student.setJointime(new Date());
		studentService.insertStudent(student);
		return "redirect:/jsp/login.jsp";
	}
	
	@RequestMapping("/logout1")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/jsp/login.jsp";
	}
	
	@RequestMapping("/toEdit1")
	public ModelAndView toEdit(HttpSession session) throws Exception{
		String name=(String) session.getAttribute("studentName");
		Student student= studentService.findOne(name);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("/edit");
		modelAndView.addObject("studentId", student.getId());
		return modelAndView;
	}
	
	@RequestMapping("/getEditInfo1")
	public @ResponseBody Student getEditInfo(Integer id) throws Exception{
		return studentService.findOneById(id);
	}
	
	@RequestMapping("/edit1")
	public String edit(Student student) throws Exception{
		studentService.editOne(student);
		return "redirect:/jsp/Success.jsp";
	}
	
	@RequestMapping("/managerStudentGetList1")
	public @ResponseBody Map<String, Object> managerStudentGetList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<Student> list = studentService.getList();
		List<Student> list2 = studentService.getListByLimit(pagination);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	
	@RequestMapping("/managerDeleteStudent1")
	public @ResponseBody String managerDeleteStudent(@RequestBody String idsStr) throws Exception{
		String[] ids = idsStr.split(",");
		for (int i = 0; i < ids.length; i++) {
			studentService.deleteOneById(Integer.parseInt(ids[i]));
		}
		return "redirect:/jsp/managerStudentList.jsp";
	}
	
}
