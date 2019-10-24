package com.lti.gladiator.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lti.gladiator.bean.Login;
import com.lti.gladiator.bean.Registration;
import com.lti.gladiator.dao.RegistrationDao;
import com.lti.gladiator.exception.RegistrationException;

@Service("registrationServices")
//@Scope("singleton")
@Transactional(propagation=Propagation.REQUIRED)
public class RegistrationServiceImpl implements RegistrationService,RegistrationDao{
	
		@Autowired
		private RegistrationDao dao;
		
		@Override
		public Registration insertNewRegistration(Registration reg) throws RegistrationException {
			return dao.insertNewRegistration(reg);
		}
		
		@Override
		public List<Registration> findAllRegistration() throws RegistrationException {
			return dao.findAllRegistration();
		}
		
		@Override
		public void deleteRegistrationById(int reg_id) throws RegistrationException {
			dao.deleteRegistrationById(reg_id);
		}
		
		@Override
		public boolean validateUser(Login login){
			  return dao.validateUser(login);
		}

		@Override
		public String findUserByEmail(String email) throws RegistrationException {
			return dao.findUserByEmail(email);
		}
	
}
