package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Student;
import po.StudentExample;

public interface StudentMapper {
    
    Student checkLogin(@Param("name")String name,@Param("password")String password);
    
    Student checkSignIn(@Param("name")String name);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}