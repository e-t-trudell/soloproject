package com.erictrudell.soloproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.soloproject.models.Shop;

public interface ShopRepository extends CrudRepository<Shop, Long> {

//	read one
	public Optional<Shop> findById(Long id);
//	read all
	public List<Shop> findAll();
//	save / update
	public Shop save(String u);
}

