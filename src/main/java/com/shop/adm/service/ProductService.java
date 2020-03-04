package com.shop.adm.service;

import com.shop.adm.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

public interface ProductService {

    Product save(Product product, MultipartFile file);

    Product update(Product product, MultipartFile file);

    Optional<Product> findOne(Long id);

    Page<Product> findAllByName(String productName, Pageable pageable);

    void delete(Long id);

}
