package com.shop.adm.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.shop.adm.domain.Category;

public interface CategoryService {

	Page<Category> getAllCategories(Pageable pageable);

	Optional<Category> getCategory(Long id);

	Category createCategory(Category category, MultipartFile file);

	Category updateCategory(Category category, MultipartFile file);

	void delete(Long id);

}
