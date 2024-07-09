package com.example.POPCornPickApi.controller.seowon0825;

import java.io.File;
import java.net.MalformedURLException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FileController {

	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	@GetMapping("/img/{newName}")
	public ResponseEntity<Resource> serveFile(@PathVariable String fileName){
		try {
			File file = new File(uploadDir + fileName);
			Resource resource = new UrlResource(file.toURI());
			if(resource.exists() || resource.isReadable()) {
				return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"").body(resource);
			} else {
				return ResponseEntity.notFound().build();
			}
		} catch(MalformedURLException e) {
			return ResponseEntity.badRequest().build();
		}
	}
}
