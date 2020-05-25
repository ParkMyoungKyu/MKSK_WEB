package com.mk.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mk.web.dto.UserInfoDTO;

@Repository
public class LoginDao implements ILoginDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int signUpSubmit(UserInfoDTO userInfoDTO) {
		return session.insert("signUp",userInfoDTO);
	}

}
