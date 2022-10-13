package com.kor.exam.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Word {
	private int id;
	private String regDate;
	private String updateDate;
	private String name;
	private String mean;
	private String type;
}