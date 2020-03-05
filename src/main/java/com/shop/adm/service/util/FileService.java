package com.shop.adm.service.util;
import org.springframework.core.io.AbstractResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.web.multipart.MultipartFile;

import com.shop.adm.domain.File;

public interface FileService {

    File save(File File);

    File createFileImage(MultipartFile file);

    Resource loadFileAsResource(String fileName);

    void delete(Long id);

    AbstractResource download (Integer fileId, HttpHeaders responseHeaders);
}
