package com.mk.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mk.web.dao.ILoginDao;
import com.mk.web.dto.UserInfoDTO;

@Service
public class LoginService implements ILoginService {
	
	@Autowired
	private ILoginDao iLoginDao;
	
	@Override
	public int signUpSubmit(UserInfoDTO userInfoDTO) {
		return iLoginDao.signUpSubmit(userInfoDTO);
	}

}
