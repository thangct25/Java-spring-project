package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devpro.enities.SaleOrder;

public interface SaleOrderRepo extends JpaRepository<SaleOrder, Integer>{

}
