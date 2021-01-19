package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.enities.Users;

@Repository
public interface UserRepo extends JpaRepository<Users, Integer>{

}
