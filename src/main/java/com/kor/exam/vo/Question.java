package com.kor.exam.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Question {
	private Word word;
//	private String name;
	private List<String>examples;
	private int answer;

}