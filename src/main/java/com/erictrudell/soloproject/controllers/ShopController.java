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


import com.erictrudell.soloproject.models.Item;
import com.erictrudell.soloproject.models.Shop;
import com.erictrudell.soloproject.models.User;
import com.erictrudell.soloproject.services.ItemService;
import com.erictrudell.soloproject.services.ShopService;
//import com.erictrudell.soloproject.models.LoginUser;
//import com.erictrudell.soloproject.models.User;
import com.erictrudell.soloproject.services.UserService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private UserService userServ;
	@Autowired
	private ShopService shopServ;
	@Autowired
	private ItemService itemServ;
//	
	@GetMapping("/new")
    public String newShop(Model model, 
    		HttpSession session,
    		RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
		Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("userId", userServ.getOneById(userId));
//    	add shop constructor to model to render form with binding
    	model.addAttribute("newShop",new Shop());
    	return "newShop.jsp";
	}
	@PostMapping("/create")
    public String create(@Valid @ModelAttribute("newShop") Shop newShop,
    		BindingResult result,
    		HttpSession session,
    		RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
		if(result.hasErrors()) return"newShop.jsp";
		Long userId = (Long) session.getAttribute("userId");
		newShop.setUser(userServ.getOneById(userId));
		shopServ.create(newShop);
        return "redirect:/home";
    }
	@GetMapping("/{shop_id}/view")
	public String showMeOneShop(@PathVariable("shop_id") Long id,
			Model model,
			HttpSession session,
			RedirectAttributes redirectAtt) {
//		protected route
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
//		Shop shop = shopServ.getOneById(id);
    	model.addAttribute("shops", shopServ.getOneById(id));
    	List<Item> allItems = itemServ.getAll();
    	model.addAttribute("allItems", allItems);
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
		return "shopView.jsp";
	}
	@GetMapping("/{id}/edit")
	public String edit(@PathVariable("id") Long id,
    		HttpSession session, 
    		Model model,
    		RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
		
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.getOneById(userId));
		model.addAttribute("allItems",itemServ.getAll());
		model.addAttribute("shop", shopServ.getOneById(id));
		return "editShop.jsp";
	}
	
	@PutMapping("/{shop_id}/update")
	public String update(@Valid @ModelAttribute("shop")Shop shop,
			BindingResult result,
			HttpSession session,
			RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
		if(result.hasErrors()) {
			return"editShop.jsp";
		}else {
			Long userId = (Long) session.getAttribute("userId");
			shop.setUser(userServ.getOneById(userId));
			shopServ.updateShop(shop);
			return"redirect:/home";
		}
	}
	@DeleteMapping("/{id}/delete")
	public String destroy(@PathVariable("id") Long id,
			HttpSession session,
			RedirectAttributes redirectAtt) {
		if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
		shopServ.deleteShop(id);
		return"redirect:/home";
	}
	
	
	
}	
