package com.shop.adm.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shop.adm.domain.Category;
import com.shop.adm.repository.CategoryRepository;
import com.shop.adm.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public Page<Category> getAllCategories(Pageable pageable) {
		return categoryRepository.findAll(pageable);
	}

	@Override
	public Optional<Category> getCategory(Long id) {
		return categoryRepository.findById(id);
	}

	@Override
	public Category createCategory(Category category) {
		return category = categoryRepository.save(category);
	}

	@Override
	public Category updateCategory(Category category) {
		return category = categoryRepository.save(category);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}

}
