package com.shop.adm.service.impl;

import java.io.FileOutputStream;
import java.nio.file.Path;

import java.io.IOException;
import java.net.MalformedURLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.AbstractResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.adm.config.ApplicationProperties;
import com.shop.adm.domain.File;
import com.shop.adm.repository.FileRepository;
import com.shop.adm.service.util.FileService;
import com.shop.adm.web.rest.errors.MyFileNotFoundException;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private ApplicationProperties applicationProperties;
	
	@Autowired
	private FileRepository fileRepository;
	
    private Path fileStorageLocation;


	public static Integer MAX_LENGTH_ORIGINAL_FILE_NAME = 200;

	@Override
	public File save(File file) {
		file.setStorage(getStorageFile());
		File f = new File();
		try {
			f = fileRepository.save(file);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public File createFileImage(MultipartFile file) {

		String path = getStorageFile();
		String fileName = file.getOriginalFilename().length() > MAX_LENGTH_ORIGINAL_FILE_NAME
				? file.getOriginalFilename().substring(0, MAX_LENGTH_ORIGINAL_FILE_NAME)
				: file.getOriginalFilename();
		if (file != null) {
			java.io.File fileCreate = new java.io.File(path +"/"+ fileName);
			try {
				fileCreate.createNewFile();
				FileOutputStream fos = new FileOutputStream(fileCreate);
				fos.write(file.getBytes());
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String getStorageFile() {
		return applicationProperties.getDocdb();
	}

	@Override
	public Resource loadFileAsResource(String fileName) {
		try {
            Path filePath = this.fileStorageLocation.resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            if(resource.exists()) {
                return resource;
            } else {
                throw new MyFileNotFoundException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new MyFileNotFoundException("File not found " + fileName, ex);
        }
	}

	@Override
	public AbstractResource download(Integer fileId , HttpHeaders responseHeaders) {
		// TODO Auto-generated method stub
        File file = fileRepository.getOne(new Long(fileId));

		responseHeaders.add("Content-Type", "application/octet-stream");
		responseHeaders.add("Content-Disposition", "attachment; filename=" + file.getName().replace(" ", ""));
        responseHeaders.add("Content-Transfer-Encoding", "binary");
        
        String filePath = getStorageFile();
        AbstractResource resource = null;
        resource = new FileSystemResource(filePath + java.io.File.separator + file.getName());
		return resource;
	}

}
