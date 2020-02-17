package com.shop.adm.web.rest;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.AbstractResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.adm.repository.CategoryRepository;
import com.shop.adm.service.CategoryService;
import com.shop.adm.service.util.FileService;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;


@RestController
@RequestMapping("/api/file")
@Transactional class FileResource {
	
    private final FileService fileService;
    private final Logger log = LoggerFactory.getLogger(CategoryResource.class);

    
    public FileResource(FileService fileService) {
        this.fileService = fileService;
    }

	
	@GetMapping("/downloadFile/{fileId}")
    public ResponseEntity<AbstractResource> downloadFile(@PathVariable Integer fileId, HttpServletRequest request) {
        // Load file as Resource
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.setContentType(MediaType.APPLICATION_JSON);
        responseHeaders.set("Access-Control-Allow-Origin", "*");
        responseHeaders.set("Access-Control-Allow-Methods", "GET, OPTIONS");
        responseHeaders.set("Access-Control-Allow-Headers", "Content-Type");
        
        return new ResponseEntity<AbstractResource>(fileService.download(fileId, responseHeaders), responseHeaders, HttpStatus.OK);

    }
}
