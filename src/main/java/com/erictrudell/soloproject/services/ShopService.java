package com.erictrudell.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erictrudell.soloproject.models.Shop;
import com.erictrudell.soloproject.repositories.ShopRepository;

@Service
public class ShopService {
//	autowire repo
	@Autowired
	private ShopRepository shopRepo;
//	create
	public Shop create(Shop u) {
//		name must be unique per model validations
    	return shopRepo.save(u);
    }
//	read one
    public Shop getOneById(Long id) {
    	Optional<Shop> shop = shopRepo.findById(id);
    	if(shop.empty() != null) {
    		return shop.get();
    	}
    	return null;
    }
//    read all
    public List<Shop> getAll() {
    	return shopRepo.findAll();
    }
//	other logic?
    public Shop updateShop(Shop i) {
    	return shopRepo.save(i);
    }
    public void deleteShop(Long id) {
    	shopRepo.deleteById(id);
    }
}
