package com.kor.exam.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Word {
	private int id;
	private String name;
	private int same_num;
	private String type;
	private String origin;
	private String pronun;
	private String usage;
	private int level;
	private String related_word;
	private String mean;
	private String example;
	private int search_num;
	private int test_num;

}