package com.erictrudell.soloproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.erictrudell.soloproject.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
//	read one
	public Optional<User> findByEmail(String email);
//	read all
	public List<User> findAll();
//	save / update
	public User save(String u);
}
