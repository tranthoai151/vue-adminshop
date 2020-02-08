package com.shop.adm.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.shop.adm.domain.Category;

public interface CategoryService {
	
	Page<Category> getAllCategories(Pageable pageable);
	
	Optional<Category> getCategory(Long id);
	
	Category createCategory(Category category);
	
	Category updateCategory(Category category);
	
	void delete(Long id);

}
