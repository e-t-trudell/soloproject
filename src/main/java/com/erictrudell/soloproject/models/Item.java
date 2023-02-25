package com.erictrudell.soloproject.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="items")
public class Item {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long item_id;
	@Column(unique=true)
	@NotEmpty(message="Description is required!")
    @Size(min=1, max=100, message="Please enter a valid description length")
    private String description;
	
	@NotNull(message="Price is required!")
	@Min(value=0, message="Please enter a larger price")
	@Max(value=99999, message="Please enter a smaller price!")
    private Double price;
	
	@NotNull(message="Quantity name is required!")
	@Min(value=0, message="Please enter a larger quantity")
	@Max(value=99999, message="Please enter a smaller quantity!")
    private Integer quantity;

	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	
//   many items to one shop
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="shop_id")
    private Shop shop;
	
//	many items to one user
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
	
//	many items to one cart
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cart_id")
    private Cart cart;
	
//	Add many to many here for categories
//	after category model is created
//	@ManyToMany(fetch = FetchType.LAZY)
//    @JoinTable(
//        name = "categories_products", 
//        joinColumns = @JoinColumn(name = "item_id"), 
//        inverseJoinColumns = @JoinColumn(name = "category_id")
//    )
//    private List<Category> categories;
	
	@PrePersist
	protected void onCreate(){
	       this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate(){
	      this.updatedAt = new Date();
	}
	public Item() {}
	public Long getItem_id() {
		return item_id;
	}
	public void setItem_id(Long item_id) {
		this.item_id = item_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	
	public Date getUpdatedAt() {
		return updatedAt;
	}
	
	
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	
	
	
	
	
	
	
}
