package com.aj22.foodlab.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aj22.foodlab.common.FileUpload;


@Controller
@RequestMapping("/upload")
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	/**
	 * quilleditor 안에서 삽입된 이미지를 서버에 저장하는 메소드(ajax 처리) 
	 * @param image 서버에 올릴 사진
	 * @param request 상대경로로 서버 안 경로를 얻기 위해 사용
	 * @return 서버에서 저장된 이미지의 이름 (savedName)
	 * @throws IOException
	 */
	@PostMapping("/img/quilleditor")
	@ResponseBody
	public String uploadImageOfQuillInServer(@RequestParam("image") MultipartFile image, HttpServletRequest request) throws IOException {
		
		String savedName = null;
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");	// 프로젝트 내의 views 파일 경로
	
		if(!image.isEmpty()) {
			savedName = new FileUpload().uploadFile(uploadPath, "quilleditor", image).getSavedName();
		}
		
		// quilleditor에 입력된 이미지를 세션에 저장해둔 후 최종적으로 저장된 html 코드와 비교해야하므로 세션으로 저장해둔다.
		// quilleditor 사진은 게시물이 최종적으로 등록이 안 된 상태여도 사진을 서버에 저장하므로 
		// 게시물이 최종적으로 등록이 안되었다면 서버에 등록된 사진들도 삭제해야한다. 
		// + 따라서 새로운 리뷰(게시물)를 작성하려고 할 때에도
		// session.removeAttribute 와 함께 서버 upload 파일에 접근해서 session quilleditorImgList에 존재하는
		
		HttpSession session = request.getSession();
		List<String> quilleditorImages = (ArrayList<String>) session.getAttribute("quilleditorImgList");
		if(quilleditorImages == null) {
			quilleditorImages = new ArrayList<>();
		}
		quilleditorImages.add(savedName);
		session.setAttribute("quilleditorImgList", quilleditorImages);
		
		return savedName;
	}
	
}
