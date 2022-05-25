
package com.aj22.foodlab.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.aj22.foodlab.controller.UploadController;
import com.aj22.foodlab.dto.FileDTO;

@Component
public class FileUpload {
	
	
	// 고유 식별값
	private UUID uid = UUID.randomUUID();
	
	/**
	 * 단일 파일 업로드 처리하는 메소드
	 * @param file : 업로드할 파일
	 * @param savedDirectory : upload 디렉토리 내에서 저장할 서브 디렉토리명 
	 * @return : 서버에서의 image 파일명
	 * @throws IOException 
	 */
	public FileDTO uploadFileToDirectoryUnderUploadPath(MultipartFile file, String savedDirectory) throws IOException {
		
		FileDTO filedto = null;
		
		String originName = file.getOriginalFilename();
		originName = new String(originName.getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지
		String uploadPath = UploadController.servletContext.getRealPath("resources/upload");
		String savedName = getSavedName(originName);	
		String savedPath = getSavedPath(uploadPath, savedDirectory, savedName); 
		
		filedto = new FileDTO(originName, savedName, savedDirectory);
		
		createDirectoryIfDirectoryNotExist(uploadPath+ File.separator + savedDirectory);
		uploadFileBytesToPath(file.getBytes(), savedPath);
		
		return filedto;
	}
	
	private void uploadFileBytesToPath(byte[] bytes, String path) throws IOException{
		OutputStream out = new FileOutputStream(new File(path));
		out.write(bytes);
		out.flush();
		out.close();
	}
	
	private void createDirectoryIfDirectoryNotExist(String directory) {
		File savedDirectoryPath= new File(directory);
		if(!savedDirectoryPath.exists()) {
			savedDirectoryPath.mkdirs();
		}
	}

	private String getSavedPath(String uploadPath, String savedDirectory, String savedName) {
		return  uploadPath + File.separator+ savedDirectory + File.separator + savedName;
	}
	
	// 같은 이름의 파일이 서버에도 같은 이름의 파일로 저장되면 안되므로 uid와 결합해서 저장
	private String getSavedName(String originFileName) {
		return uid + "_" + originFileName;
	}

}
