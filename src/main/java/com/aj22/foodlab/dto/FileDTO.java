package com.aj22.foodlab.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class FileDTO {
	private String originName;
	private	String savedName;
	private String savedDirectory;
}
