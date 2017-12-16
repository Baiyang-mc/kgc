package com.atguigu.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.atguigu.crud.bean.Employee;
import com.github.pagehelper.PageInfo;

/****
 * 使用Spring单元测试提供的测试请求功能，来测试curd请求的正确性
 * 
 * @author baiya
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class MvcTest {
	// 传入SpringMVC的ioc
	@Autowired
	WebApplicationContext context;
	// 虚拟的MVC请求，请求处理结果
	MockMvc mockMvc;

	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testPage() throws Exception {
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
		MockHttpServletRequest request = result.getRequest();
		PageInfo pInfo = (PageInfo) request.getAttribute("pageInfo");
		System.out.println(pInfo);
		// 请求成功后，请求域中会有pageInfo，我们可以取出怕个Info进行验证
		System.out.println("当前页码" + pInfo.getPageNum());
		System.out.println("总页码" + pInfo.getPages());
		System.out.println("总记录数" + pInfo.getTotal());
		int[] nums = pInfo.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(" " + i);
		}
		System.out.println();
		// 获取员工数据
		List<Employee> list = pInfo.getList();
		for (Employee employee : list) {
			System.out.println("ID:" + employee.getEmpId() + "==>Name" + employee.getEmpName());
		}

	}
}
