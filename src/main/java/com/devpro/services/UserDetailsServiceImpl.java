package com.devpro.services;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.devpro.enities.Users;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
	@PersistenceContext protected EntityManager entityManager;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		try {
			String sql = "SELECT * FROM tbl_users where username = '" + username +"'";
			Query query = entityManager.createNativeQuery(sql, Users.class);
			return (Users) query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
