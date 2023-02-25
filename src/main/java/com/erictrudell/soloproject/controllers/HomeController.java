package com.erictrudell.soloproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erictrudell.soloproject.models.Item;
import com.erictrudell.soloproject.models.LoginUser;
import com.erictrudell.soloproject.models.Shop;
import com.erictrudell.soloproject.models.User;
import com.erictrudell.soloproject.services.ItemService;
import com.erictrudell.soloproject.services.ShopService;
import com.erictrudell.soloproject.services.UserService;


@Controller
public class HomeController {
	
	@Autowired
	private UserService userServ;
	@Autowired
	private ShopService shopServ;
	@Autowired
	private ItemService itemServ;
	
	@GetMapping("/")
    public String index(Model model,
    		HttpSession session) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
//        session.removeAttribute("userId");
        List<User> allUsers = userServ.getAll();
        model.addAttribute("allUsers", allUsers);
        return "index.jsp";
    }
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
    		BindingResult result,
    		Model model,
    		HttpSession session,
    		RedirectAttributes redirectAtt) {
    	User createdUser = userServ.register(newUser, result);
//    	System.out.println(createdUser);
        if(createdUser == null) {
            model.addAttribute("newLogin", new LoginUser());
            redirectAtt.addFlashAttribute("regError", "Please complete registration to continue.");
            return "redirect:/";
        }
//      You have already created the user in the service in register method
//      userServ.create(createdUser);
        session.setAttribute("userId", createdUser.getId());
//      System.out.println(session.getAttribute("userId"));
        return "redirect:/home";
        
    }
	@GetMapping("/createError")
    public String flashMessage(RedirectAttributes redirectAtt) {
    	redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    	return "redirect:/";
    }
//	do you need a home/{id} for a land specific to the user?
	@GetMapping("/home")
    public String home(
    		Model model, 
    		HttpSession session,
    		RedirectAttributes redirectAtt) {
    	if(session.getAttribute("userId") == null) {
    		redirectAtt.addFlashAttribute("Error", "Please log-in to continue.");
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("userId", userServ.getOneById(userId));
    	User user = userServ.getOneById(userId);
//    	when you set the "user" to  session.getAttribute("userId") you get an error that Long does not have a property of id
    	model.addAttribute("user", user);
    	List<Shop> shops = shopServ.getAll();
    	model.addAttribute("shops", shops);
    	List<Item> allItems = itemServ.getAll();
    	model.addAttribute("allItems", allItems);
    	return"home.jsp";
    }
	@PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
             Model model,
             BindingResult result,
             HttpSession session,
             RedirectAttributes redirectAtt) {
        User loggedUser = userServ.login(newLogin, result);
        if(loggedUser == null) {
        	redirectAtt.addFlashAttribute("logError", "Please log in to continue.");
            model.addAttribute("newLogin", new LoginUser());
            model.addAttribute("newUser", new User());
            return "redirect:/";
        }
        session.setAttribute("userId", loggedUser.getId());
        return"redirect:/home";
    }
	@GetMapping("/logout")
    public String leave(HttpSession session) {
    	session.removeAttribute("userId");
//    	removes everything out of session, 
//    	context dependent be careful using this
//    	session.invalidate();
    	
    	return "redirect:/";
    }
	
	
	
	
	
	
	
	
	
	
	
}
