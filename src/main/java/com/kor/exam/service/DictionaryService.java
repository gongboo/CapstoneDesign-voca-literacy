package com.kor.exam.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kor.exam.repository.DictionaryRepository;
import com.kor.exam.utill.Ut;
import com.kor.exam.vo.ResultData;
import com.kor.exam.vo.Word;

@Service
public class DictionaryService {
	private DictionaryRepository dictionaryRepository;

	
	public DictionaryService(DictionaryRepository dictionaryRepository) {
		this.dictionaryRepository = dictionaryRepository;
	}

	public List<Word> getForPrintWords(String searchKeyword,String searchKeywordTypeCode, int itemsCountInAPage, int page) {
		int limitStart = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;
//		List<Word> words = dictionaryRepository.getForPrintWords(searchKeyword, searchKeywordTypeCode, limitStart, limitTake);
		List<Word> words = dictionaryRepository.MakeDictionary(searchKeyword, searchKeywordTypeCode, limitStart, limitTake);

		return words;
	}

//	public Word getForPrintWord(int id) {
//		Word word = dictionaryRepository.getWordbyId(id);
//
//		return word;
//	}
	public Word getForPrintWord(String name) {
		Word word = dictionaryRepository.getWordbyName(name);
		return word;
	}

	public int getWordsCount(String searchKeywordTypeCode, String searchKeyword) {
		return dictionaryRepository.getWordsCount(searchKeywordTypeCode, searchKeyword);
	}

	public Word getWordbyId(int id) {
		return dictionaryRepository.getWordbyId(id);
	}
	


}