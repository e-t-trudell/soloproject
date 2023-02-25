package com.erictrudell.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erictrudell.soloproject.models.Cart;
import com.erictrudell.soloproject.models.Item;
import com.erictrudell.soloproject.repositories.CartRepository;
import com.erictrudell.soloproject.repositories.ItemRepository;

@Service
public class CartService {
	@Autowired
	private CartRepository cartRepo;
	@Autowired
	private ItemRepository itemRepo;
//	create / update
	public Cart create(Cart newCart) {
		
		return cartRepo.save(newCart);
	}
//	read one
    public Cart getOneById(Long id) {
    	Optional<Cart> cart = cartRepo.findById(id);
    	if(cart.empty() != null) {
    		return cart.get();
    	}
    	return null;
    }
//    read all
    public List<Cart> getAll() {
    	return cartRepo.findAll();
    }
}
