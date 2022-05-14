
package com.aj22.foodlab.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.aj22.foodlab.dto.FileDTO;


public class FileUpload {
	
	// 고유 식별값
	private UUID uid = UUID.randomUUID();
	
	/**
	 * 단일 파일 업로드 처리하는 메소드
	 * @param uploadPath : 프로젝트 내 resources/upload/ 절대 경로 
	 * @param image : 업로드할 파일
	 * @param savedDirectory : upload 디렉토리 내에서 저장할 서브 디렉토리명 
	 * @return : 서버에서의 image 파일명
	 * @throws IOException 
	 */
	public String uploadFileForQuill(String uploadPath, String savedDirectory,  MultipartFile image) throws IOException {
		String originFileName = image.getOriginalFilename();
		// 같은 이름의 파일이 서버에도 같은 이름의 파일로 저장되면 안되므로 uid와 결합해서 저장
		String savedName = getSavedName(originFileName);	
		String savedPath = getSavedPath(uploadPath, savedDirectory, savedName); 
				
		byte[] bytes = image.getBytes();

		// upload or {savedDirectory} 디렉토리가 없다면 생성해준다.
		File savedDirectoryPath= new File(uploadPath+ File.separator + savedDirectory);
		if(!savedDirectoryPath.exists()) {
			savedDirectoryPath.mkdirs();
		}
		
		
		// 파일 쓰기를 위한 스트림
		OutputStream out = new FileOutputStream(new File(savedPath));
		out.write(bytes);
		out.flush();

		out.close();
		
		System.out.println(savedPath + ": 에 저장됨");
		
		return savedName;
	}

	private String getSavedPath(String uploadPath, String savedDirectory, String savedName) {
		return  uploadPath + File.separator+ savedDirectory + File.separator + savedName;
	}
	
	private String getSavedName(String originFileName) {
		return uid + "_" + originFileName;
	}
}
