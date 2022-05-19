package com.aj22.foodlab.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.aj22.foodlab.common.FileUpload;
import com.aj22.foodlab.dto.FileDTO;


@Controller
@RequestMapping("/upload")
public class UploadController implements ServletContextAware {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	public static ServletContext servletContext;
	
	/**
	 * quilleditor 안에서 삽입된 이미지를 서버에 저장하는 메소드(ajax 처리) 
	 * @param image 서버에 올릴 사진
	 * @param request 상대경로로 서버 안 경로를 얻기 위해 사용
	 * @return 서버에서 저장된 이미지의 이름 (savedName)
	 */
	@PostMapping("/img/quilleditor")
	@ResponseBody
	public String uploadImageOfQuillInServer(@RequestParam("image") MultipartFile image, HttpServletRequest request) throws IOException {
		
		FileDTO filedto= (new FileUpload()).uploadFileToDirectoryUnderUploadPath(image, "quilleditor");
		addThisImageToSession(filedto.getSavedName(), request);
		
		return filedto.getSavedName();
	}
	
	// quilleditor에 입력된 이미지를 세션에 저장해둔 후 최종적으로 저장된 html 코드와 비교해서 최종적으로 저장된
	// 이미지가 아니면 삭제해야하므로 세션으로 저장하고 관리한다.
	private void addThisImageToSession(String imageName, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> quilleditorImages = (ArrayList<String>) session.getAttribute("quilleditorImgList");
		
		if(quilleditorImages == null) {
			quilleditorImages = new ArrayList<>();
		}
		
		quilleditorImages.add(imageName);
		session.setAttribute("quilleditorImgList", quilleditorImages);
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		if(UploadController.servletContext == null) {
			UploadController.servletContext = servletContext;
		}
	}
	
}
