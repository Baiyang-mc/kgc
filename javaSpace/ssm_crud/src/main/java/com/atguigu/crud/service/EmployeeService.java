package com.atguigu.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.bean.EmployeeExample.Criteria;
import com.atguigu.crud.dao.EmployeeMapper;

@Service
public class EmployeeService
{

    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll()
    {
	EmployeeExample employeeExample = new EmployeeExample();
	employeeExample.setOrderByClause("emp_id");
	return employeeMapper.selectByExampleWithDept(employeeExample);
    }

    /***
     * 员工保存
     * 
     * @param employee
     */
    public void seveEmp(Employee employee)
    {
	employeeMapper.insertSelective(employee);
    }

    public Employee get_Emp(Integer id)
    {
	// TODO Auto-generated method stub
	return employeeMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Employee employee)
    {
	// TODO Auto-generated method stub
	employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmp(Integer id)
    {
	// TODO Auto-generated method stub
	employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatchEmp(List<Integer> del_ids)
    {
	// TODO Auto-generated method stub
	EmployeeExample employeeExample = new EmployeeExample();
	Criteria criteria = employeeExample.createCriteria();
	criteria.andEmpIdIn(del_ids);
	employeeMapper.deleteByExample(employeeExample);
    }

}
