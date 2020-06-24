package com.mk.web.dao;

import com.mk.web.dto.UserInfoDTO;

public interface ILoginDao {

	int signUpSubmit(UserInfoDTO userInfoDTO);

	int checkId(UserInfoDTO userInfoDTO);

}
