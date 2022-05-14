package com.aj22.foodlab.dto;

public class FileDTO {
	private String originName;
	private	String savedName;
	private String savedDirectory;
	
	
	public FileDTO() {
		super();
	}

	public FileDTO(String originName, String savedName, String savedDirectory) {
		super();
		this.originName = originName;
		this.savedName = savedName;
		this.savedDirectory = savedDirectory;
	}

	public String getOriginName() {
		return originName;
	}

	public String getSavedName() {
		return savedName;
	}

	public String getSavedDirectory() {
		return savedDirectory;
	}
	
	
}
