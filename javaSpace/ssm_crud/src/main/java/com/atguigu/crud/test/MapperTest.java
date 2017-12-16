package com.atguigu.crud.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;

/**
 * 测试dao功能
 * 
 * @author baiya Spring项目推荐使用Spring的单元测试，可以自动注入我们需要的组件 1.导入spring单元测试 2.使用
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	/**
	 * 测试DepartmentMapper
	 */
	@Autowired(required = true)
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession SqlSession;

	public void testInsert() {
		// 3.批量插入多个员工，可以使用执行批量操作的sqlSession
		EmployeeMapper mapper = SqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 1000; i++) {
			String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Employee(null, uuid, "M", uuid + "@guigu.com", 2));
		}

		System.out.println("成功");

	}

	@Test
	public void testCRUD() {
		/*
		 * ApplicationContext ioContext=new
		 * ClassPathXmlApplicationContext("classpath:appLocationContext.xml");
		 * DepartmentMapper bean=ioContext.getBean(DepartmentMapper.class);
		 */
		/*
		 * System.out.println(departmentMapper.toString());
		 * departmentMapper.insertSelective(new Department(null,"测试部"));
		 * employeeMapper.insertSelective(new
		 * Employee(null,"baiyang","M","274269074@qq.com",1)); Employee
		 * e=employeeMapper.selectByPrimaryKey(1); System.out.println(e);
		 */

		// 3.批量插入多个员工，可以使用执行批量操作的sqlSession

		/*
		 * List<Employee> list = employeeMapper.selectByExample(null); for (int i = 0; i
		 * < 1000; i++) { System.out.println(list.get(i)); }
		 */

		System.out.println("selectByPrimaryKeyWithDept的测试");
		Employee employee = employeeMapper.selectByPrimaryKeyWithDept(15);
		System.out.println(employee);
		
		System.out.println("selectByExampleWithDept的测试");
		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
		for (int i = 0; i < 1000; i++) {
			System.out.println(list.get(i));
		}

	}
}
