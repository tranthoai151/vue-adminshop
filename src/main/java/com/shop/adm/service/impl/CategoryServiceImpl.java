package com.shop.adm.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.adm.config.ApplicationProperties;
import com.shop.adm.domain.Category;
import com.shop.adm.domain.File;
import com.shop.adm.repository.CategoryRepository;
import com.shop.adm.service.CategoryService;
import com.shop.adm.service.util.FileService;
import com.shop.adm.util.Constant;
import com.shop.adm.util.StatusEnum;

@Service
public class CategoryServiceImpl implements CategoryService{


	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
    private ApplicationProperties applicationProperties;

	@Autowired
	private FileService fileService;

	@Override
	public Page<Category> getAllCategories(Pageable pageable) {
        String folderPath = applicationProperties.getDocdb();
        return categoryRepository.findAll(pageable);
	}

	@Override
	public Optional<Category> getCategory(Long id) {
        String folderPath = applicationProperties.getDocdb();

		return categoryRepository.findById(id);
	}

	@Override
	public Category createCategory(Category category, MultipartFile file) {
		//create file in storage
		if(file != null) {
			fileService.createFileImage(file);
		}

		File f = new File();
		f.setName(file.getOriginalFilename());
		f.setStatus(StatusEnum.ACTIVE.getValue());
		fileService.save(f);

		category.setFile(f);
		category.setImgUrl(Constant.URL_IMG + f.getId());
		return category = categoryRepository.save(category);
	}

	@Override
	public Category updateCategory(Category category, MultipartFile file) {
        Category categoryExist = categoryRepository.getOne(category.getId());

        if(!file.isEmpty() && categoryExist.getFile().getName() != file.getOriginalFilename()){
            fileService.delete(categoryExist.getFile().getId());
            //create file
            File f = new File();
            f.setName(file.getOriginalFilename());
            f.setStatus(StatusEnum.ACTIVE.getValue());
            fileService.save(f);

        }
		return category = categoryRepository.save(category);
	}

	@Override
	public void delete(Long id) {
	    Category category = categoryRepository.getOne(id);

	    //delete file store
        fileService.delete(category.getFile().getId());

        //delete category
        categoryRepository.deleteById(id);
	}

}
