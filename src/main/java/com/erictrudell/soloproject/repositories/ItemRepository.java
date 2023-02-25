package com.erictrudell.soloproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.soloproject.models.Item;

public interface ItemRepository extends CrudRepository<Item, Long> {

//	read one
	public Optional<Item> findById(Long id);
//	read all
	public List<Item> findAll();
//	save / update
	public Item save(String u);
}
