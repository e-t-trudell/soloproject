package com.erictrudell.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.erictrudell.soloproject.models.LoginUser;
import com.erictrudell.soloproject.models.User;
import com.erictrudell.soloproject.repositories.UserRepository;
@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	public User create(User u) {
    	return userRepo.save(u);
    }
	
    public User getOneById(Long id) {
    	Optional<User> user = userRepo.findById(id);
    	if(user.empty() != null) {
    		return user.get();
    	}
    	return null;
    }
    
    public List<User> getAll() {
    	return userRepo.findAll();
    }
    
    public User register(User newUser, BindingResult result){
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "werewolf", "Passwords don't match!");
    	}
    	if(!result.hasErrors()) {
    			newUser.setPassword(BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt()));
    			return this.create(newUser);
    		}
    	return null;
    }

    public User login(LoginUser newLogin,
    		BindingResult result) {
    	Optional<User> user = userRepo.findByEmail(newLogin.getEmail());
    	String hashed = BCrypt.hashpw(newLogin.getPassword(), BCrypt.gensalt());
//    	if(user.isPresent() && newLogin.getPassword().equals(user.get().getPassword())) {
//    		result.rejectValue("password", "Werewolf", "Invalid credentials");
//    		return user.get();
//    	}
    	if(user.isPresent() && BCrypt.checkpw(newLogin.getPassword(), user.get().getPassword())) {
    	    result.rejectValue("password", "Gryffin", "Invalid Hash!");
    	    return user.get();
    	}
    	
    	return null;
    }
}
