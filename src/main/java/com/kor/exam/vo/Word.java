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
	private String same_num;
	private String group;
	private String type;
	private String origin;
	private String pronun;
	private String usage;
	private String derivatice;
	private String level;
	private String category;
	private String topic;
	private String full_ref;
	private String search_type;
	private String related_word;
	private String ref;
	private String mean;
	private String example;
	private int search_num;
	private int test_num;

}