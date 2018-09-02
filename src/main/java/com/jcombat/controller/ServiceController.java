package com.jcombat.controller;

import java.util.Date;

// https://github.com/abhi435/SecureRESTWithOAuth

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jcombat.bean.Employee;
import com.jcombat.bean.ServiceDetailAPI;

@RestController
@RequestMapping(value = "/api/ServiceDetailAPI")
public class ServiceController {
	
	@RequestMapping(value = "/{name}", method = RequestMethod.GET)
	public ServiceDetailAPI process(
			@PathVariable("name") String name,
			@RequestParam(value = "id", required = false, defaultValue = "00001") final String id) {
		
		ServiceDetailAPI employee = new ServiceDetailAPI();
		employee.setId(id);
		employee.setName(name);
		employee.setTimeStamp(String.valueOf(new Date()));
		return employee;
	}
}