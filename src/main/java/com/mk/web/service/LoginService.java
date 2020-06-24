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

	@Override
	public int checkId(UserInfoDTO userInfoDTO) {
		int result = iLoginDao.checkId(userInfoDTO);
		System.out.println("Service result 값 " + result);
		return result;
	}

}
