package com.erictrudell.soloproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.soloproject.models.Cart;
import com.erictrudell.soloproject.models.Item;

public interface CartRepository extends CrudRepository<Cart, Long>{
//	read one
	public Optional<Cart> findById(Long id);
//	read all
	public List<Cart> findAll();
//	save / update
	public Cart save(Item i);
}
