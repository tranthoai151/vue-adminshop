package com.shop.adm.service.impl;

import com.shop.adm.domain.File;
import com.shop.adm.domain.Product;
import com.shop.adm.repository.CategoryRepository;
import com.shop.adm.repository.ProductRepository;
import com.shop.adm.service.ProductService;
import com.shop.adm.service.util.FileService;
import com.shop.adm.util.Constant;
import com.shop.adm.util.StatusEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private FileService fileService;

    @Override
    public Product save(Product product, MultipartFile file) {
        if(file != null) {
            fileService.createFileImage(file);
        }
        File f = new File();
        f.setName(file.getOriginalFilename());
        f.setStatus(StatusEnum.ACTIVE.getValue());
        product.setImgUrl(Constant.URL_IMG);
        productRepository.save(product);
        return product;
    }

    @Override
    public Product update(Product product, MultipartFile files) {

        productRepository.save(product);
        return null;
    }

    @Override
    public Optional<Product> findOne(Long id) {
        return productRepository.findById(id);
    }

    @Override
    public Page<Product> findAllByName(String productName, Pageable pageable) {
        return null;
    }

    @Override
    public void delete(Long id) {

    }
}
