package controller;

import java.awt.Font;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Pagination;
import po.QueryResult;
import po.Student;
import po.Studentresult;
import po.StudentresultCustom;
import service.ResultService;
import service.StudentService;

@Controller
public class ResultController {
	@Autowired
	private ResultService resultService;
	
	@Autowired
	private StudentService studentService;

	@RequestMapping("/managerGetQueryResult1")
	public @ResponseBody Map<String, Object> managerGetQueryResult(Pagination pagination,QueryResult queryResult) throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		List<Studentresult> list=resultService.getList();
		if (queryResult.getOption()==null) {
			queryResult.setOption("");
		}
		if (queryResult.getValue()==null) {
			queryResult.setValue("");
		}
		List<StudentresultCustom> list2=resultService.getListByLimit(pagination,queryResult);
		map.put("rows", list2);
		map.put("total", list.size());
		return map;
	}
	
	@RequestMapping("/queryResult1")
	public @ResponseBody List<StudentresultCustom> queryResult(HttpSession session,Pagination pagination,QueryResult queryResult) throws Exception{
		String studentName = (String) session.getAttribute("studentName");
		Student student = studentService.findOne(studentName);
		List<StudentresultCustom> studentlist = resultService.getListByStudentId(student.getId());
		if (queryResult.getOption()==null) {
			queryResult.setOption("");
		}
		if (queryResult.getValue()==null) {
			queryResult.setValue("");
		}
		return studentlist;
	}
	
	@RequestMapping("/saveExcel1")
	public void saveExcel(HttpSession session,HttpServletResponse response) throws Exception{
		String studentName = (String) session.getAttribute("studentName");
		Student student = studentService.findOne(studentName);
		List<StudentresultCustom> list = resultService.getListByStudentId(student.getId());
		Workbook workbook=new HSSFWorkbook();
		Sheet sheet = workbook.createSheet("您的考试成绩单");
		Row row=sheet.createRow(0);
		Cell cell00=row.createCell(0);
		cell00.setCellValue("考试课程");
		Cell cell01=row.createCell(1);
		cell01.setCellValue("准号证号");
		Cell cell02=row.createCell(2);
		cell02.setCellValue("单选题成绩");
		Cell cell03=row.createCell(3);
		cell03.setCellValue("多选题成绩");
		Cell cell04=row.createCell(4);
		cell04.setCellValue("总成绩");
		Cell cell05=row.createCell(5);
		cell05.setCellValue("考试时间");
		for (int i = 0; i < list.size(); i++) {
			StudentresultCustom studentresultCustom = list.get(i);
			row=sheet.createRow(i+1);
			Cell cell0=row.createCell(0);
			cell0.setCellValue(studentresultCustom.getLessonname());
			Cell cell1=row.createCell(1);
			cell1.setCellValue(studentresultCustom.getExamnumber());
			Cell cell2=row.createCell(2);
			cell2.setCellValue(studentresultCustom.getResingle());
			Cell cell3=row.createCell(3);
			cell3.setCellValue(studentresultCustom.getResmore());
			Cell cell4=row.createCell(4);
			cell4.setCellValue(studentresultCustom.getRestotal());
			
			Cell cell5=row.createCell(5);
			cell5.setCellValue(studentresultCustom.getCreatetime());
			//获取单元格样式
			CreationHelper creationHelper = workbook.getCreationHelper();
			CellStyle cellStyle = workbook.createCellStyle();
			//定义单元格日期样式
			cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-mm-dd hh:mm:ss"));
			//设置单元格样式
			cell5.setCellStyle(cellStyle);
		}
		
		resultService.export(response, workbook, "examResults.xls");
	}
	
}
