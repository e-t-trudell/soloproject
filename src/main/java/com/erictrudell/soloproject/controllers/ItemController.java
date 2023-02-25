package com.erictrudell.soloproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erictrudell.soloproject.models.Cart;
import com.erictrudell.soloproject.models.Item;
import com.erictrudell.soloproject.models.Shop;
import com.erictrudell.soloproject.models.User;
import com.erictrudell.soloproject.services.CartService;
import com.erictrudell.soloproject.services.ItemService;
import com.erictrudell.soloproject.services.ShopService;
import com.erictrudell.soloproject.services.UserService;

@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private UserService userServ;
	@Autowired
	private ItemService itemServ;
	@Autowired
	private ShopService shopServ;
	@Autowired
	private CartService cartServ;
	
	
	@GetMapping("/new")
    public String newItem(Model model, 
    		HttpSession session,
    		RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
		Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("userId", userServ.getOneById(userId));
//    	add item constructor to model to render form with binding
    	model.addAttribute("newItem",new Item());
    	model.addAttribute("shops", shopServ.getAll());
    	return "newItem.jsp";
	}
	@PostMapping("/create")
    public String create(@Valid @ModelAttribute("newItem") Item newItem,
    		BindingResult result,
    		HttpSession session,
    		Model model,
    		RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
			redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";}
		if(result.hasErrors()) return"newItem.jsp";
		Long userId = (Long) session.getAttribute("userId");
		newItem.setUser(userServ.getOneById(userId));
//		Long shopId = (Long) model.getAttribute("shop");
//		newItem.setShop(shopServ.getOneById(shopId)); 
//		
		itemServ.create(newItem);
        return "redirect:/home";
    }
	@GetMapping("/{item_id}/view")
	public String showMeOneItem(@PathVariable("item_id") Long id,
			
			Model model,
			HttpSession session,
			RedirectAttributes redirectAtt) {
//		@PathVariable("shop_id") Long shop_id,
//		protected route
		if(session.getAttribute("userId") == null) {
			redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";}
//		Shop shop = shopServ.getOneById(id);
		Item item = itemServ.getOneById(id);
    	model.addAttribute("item", item);
    	Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.getOneById(userId));
//    	Shop shop = shopServ.getOneById(shop_id);
//    	model.addAttribute("shop", shop);
		return "itemView.jsp";
	}
	@GetMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id,
    		HttpSession session, 
    		Model model,
    		RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
			redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";}
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.getOneById(userId));
		model.addAttribute("item",itemServ.getOneById(id));
		model.addAttribute("shops", shopServ.getAll());
		return "editItem.jsp";
	}
	@PutMapping("/{item_id}/update")
	public String update(@Valid @ModelAttribute("item")Item item,
			BindingResult result,
			HttpSession session,
			RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
			redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";}
		if(result.hasErrors()) {
			return"editItem.jsp";
		}else {
			Long userId = (Long) session.getAttribute("userId");
			item.setUser(userServ.getOneById(userId));
			
			itemServ.updateItem(item);
			return"redirect:/home";
		}
	}
	@PostMapping("/{id}/newCart")
	public String newCart(@ModelAttribute("newCart") Cart newCart,
			@PathVariable("id") Long id,
			BindingResult result,
			HttpSession session,
			Model model,
			RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.getOneById(userId);
		model.addAttribute("user", userId);
		
		List<Shop> shops = shopServ.getAll();
		model.addAttribute("allShops", shops);
		
		Item item = itemServ.getOneById(id);
		List<Item> items = itemServ.getAll();
		items.add(item);
		model.addAttribute("allItems",items);
		
		newCart.setUser(user);
		newCart.setItems(items);
		Cart cart = cartServ.create(newCart);
		if(cart != null) {
    		redirectAtt.addFlashAttribute("Success", "Please continue browsing!");
    		return "redirect:/home";
    	}
		return null;
	}
	
//Add after successfully adding to cart
//	@PutMapping(removefromcart)
	
	@DeleteMapping("/{id}/delete")
	public String destroy(@PathVariable("id") Long id,
			RedirectAttributes redirectAtt,
			HttpSession session) {
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
		itemServ.deleteItem(id);
		return"redirect:/home";
	}
}
