package com.lec.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.emp.domain.Dept;
import com.lec.emp.domain.Emp;
import com.lec.emp.repository.DeptRepository;
import com.lec.emp.repository.EmpRepository;
@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpRepository empRepository;
	@Autowired 
	private DeptRepository deptRepository;
	
	@Override
	public List<Dept> deptList() {
		// TODO Auto-generated method stub
		return deptRepository.deptList();
	}

	@Override
	public List<Emp> empList(Emp searchEmp) {
		if(searchEmp.getEname() != null) {  // ename이 널이 아니면   
			searchEmp.setEname(searchEmp.getEname().toUpperCase());  //set해라 ename을 대문자로 
		}
		if(searchEmp.getJob()!= null) {  // job이 널이 아니면 
			searchEmp.setJob(searchEmp.getJob().toUpperCase()); //set해라 job을 대문자로
		}
		return empRepository.empList(searchEmp);
	}

}
