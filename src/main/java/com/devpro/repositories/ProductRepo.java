package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.enities.Products;

@Repository
public interface ProductRepo extends JpaRepository<Products, Integer>  {

}
