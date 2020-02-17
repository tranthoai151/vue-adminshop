package com.shop.adm.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.adm.domain.File;

public interface FileRepository extends JpaRepository<File, Long>{

}
