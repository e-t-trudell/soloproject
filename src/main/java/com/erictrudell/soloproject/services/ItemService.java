package com.erictrudell.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.erictrudell.soloproject.models.Item;
import com.erictrudell.soloproject.repositories.ItemRepository;

@Service
public class ItemService {
	@Autowired
	private ItemRepository itemRepo;
	
//	create
	public Item create(Item i) {
//		description must be unique per model validations
		return itemRepo.save(i);
	}
//	read one
    public Item getOneById(Long id) {
    	Optional<Item> item = itemRepo.findById(id);
    	if(item.empty() != null) {
    		return item.get();
    	}
    	return null;
    }
//    read all
    public List<Item> getAll() {
    	return itemRepo.findAll();
    }
    public Item updateItem(Item i) {
		return itemRepo.save(i);
	}
	public void deleteItem(Long id) {
		itemRepo.deleteById(id);
	}
	public void addCart(Item i) {
		itemRepo.save(i);
	}
	
}
