package com.atguigu.crud.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController
{
    /***
     * 查询员工数据（分页查询 ）
     * 
     * @return
     */
    @Autowired
    EmployeeService employeeService;

    // 查询所有员工
    /***
     * 
     * @param pn
     * @param model
     * @return Spring单元测试的时候不需要@ResponseBody
     */
    @ResponseBody
    @RequestMapping(value = "/emps", method = RequestMethod.GET)
    public Msg getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model)
    {
	PageHelper.startPage(pn, 5);
	// startPage紧跟的查询就是一个分页查询
	List<Employee> emps = employeeService.getAll();
	// 使用pageInfo包装查询后结果，衹需要將pageInf交給頁面
	// pageInfo封装了分页信息，包括查询的数据
	PageInfo pageInfo = new PageInfo(emps, 5);
	model.addAttribute("pageInfo", pageInfo);
	return Msg.success().add("pageInfo", pageInfo);
    }

    // 保存员工信息
    @RequestMapping(value = "/emps", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(Employee employee)
    {
	employeeService.seveEmp(employee);
	return Msg.success();
    }

    // 根据员工ID查询员工信息
    @RequestMapping(value = "/emps/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id)
    {
	Employee employee = employeeService.get_Emp(id);
	return Msg.success().add("emp", employee);
    }

    // 更新员工数据
    @ResponseBody
    /* @RequestMapping(value = "/emps/{id}", method = RequestMethod.PUT) */
    // 修改id为empId，从而在employee中谈添加empId
    @RequestMapping(value = "/emps/{empId}", method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee)
    {
	employeeService.updateEmp(employee);
	return Msg.success();
    }

    // 删除员工
    @ResponseBody
    @RequestMapping(value = "/emps/{empId}", method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("empId") String empId)
    {
	List<Integer> del_ids = new ArrayList<Integer>();
	String[] str = empId.split("-");
	for (String s : str)
	{
	    del_ids.add(Integer.parseInt(s));
	}
	employeeService.deleteBatchEmp(del_ids);
	System.out.println("删除员工号为" + empId + "的员工");

	return Msg.success();
    }

}
