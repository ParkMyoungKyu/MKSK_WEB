package com.mk.web.service;

import com.mk.web.dto.UserInfoDTO;

public interface ILoginService {
	
	int signUpSubmit(UserInfoDTO userInfoDTO);

	int checkId(UserInfoDTO userInfoDTO);

}
