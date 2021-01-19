package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.enities.Roles;

public interface RoleRepo extends JpaRepository<Roles, Integer> {

}
