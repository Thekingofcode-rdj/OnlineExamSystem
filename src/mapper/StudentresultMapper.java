package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Studentresult;
import po.StudentresultExample;

public interface StudentresultMapper {

    int deleteByExample(StudentresultExample example);
    
    Studentresult selectStudentResultOne(String name);

    int deleteByPrimaryKey(Integer id);

    int insert(Studentresult record);

    int insertSelective(Studentresult record);

    List<Studentresult> selectByExample(StudentresultExample example);

    Studentresult selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Studentresult record, @Param("example") StudentresultExample example);

    int updateByExample(@Param("record") Studentresult record, @Param("example") StudentresultExample example);

    int updateByPrimaryKeySelective(Studentresult record);

    int updateByPrimaryKey(Studentresult record);
}