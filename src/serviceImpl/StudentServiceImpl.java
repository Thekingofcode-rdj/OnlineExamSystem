package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import mapper.StudentMapper;
import mapper.StudentMapperCustom;
import po.Pagination;
import po.Student;
import po.StudentExample;
import po.StudentExample.Criteria;
import service.StudentService;

public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	@Autowired
	private StudentMapperCustom studentMapperCustom;
	
	@Transactional
	public Integer insertStudent(Student student) throws Exception{
		return studentMapper.insertSelective(student);
	}

	public Student findOne(String name) throws Exception {
		StudentExample example=new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		List<Student> list = studentMapper.selectByExample(example);
		return list.get(0);
	}

	public Student findOneById(Integer id) throws Exception {
		Student student = studentMapper.selectByPrimaryKey(id);
		return student;
	}

	@Transactional
	public void editOne(Student student) throws Exception {
		studentMapper.updateByPrimaryKeySelective(student);
	}

	public List<Student> getList() throws Exception {
		StudentExample example=new StudentExample();
		List<Student> list = studentMapper.selectByExample(example);
		return list;
	}

	public List<Student> getListByLimit(Pagination pagination) throws Exception {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		List<Student> list = studentMapperCustom.getListByLimit(pagination);
		return list;
	}
	
	@Transactional
	public void deleteOneById(Integer id) {
		studentMapper.deleteByPrimaryKey(id);		
	}

	@Override
	@Transactional
	public Student checkLoginByNameAndPass(String name, String password) throws Exception {
		Student student = studentMapper.checkLogin(name, password);	
		return student;
	}

	@Transactional
	public Student checkSignIn(String name) throws Exception {
		Student student = studentMapper.checkSignIn(name);
		return student;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
