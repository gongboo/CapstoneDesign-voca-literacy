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

	public List<Word> getForPrintWords(String searchKeyword,String searchKeywordTypeCode, int itemsCountInAPage, int page,int search,int memberId) {
		int limitStart = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;
		List<Word> words = dictionaryRepository.MakeDictionary(searchKeyword, searchKeywordTypeCode, limitStart, limitTake);
		if(search!=0) {
		dictionaryRepository.SearchNumUpdate(searchKeyword,searchKeywordTypeCode);
		for(int i=0;i<words.size();i++) {
		dictionaryRepository.SearchRecord(memberId, words.get(i).getName());
		}
		}

		return words;
	}


	public Word getWordbyName(String name) {
		Word word = dictionaryRepository.getWordbyName(name);
		return word;
	}

	public int getWordsCount(String searchKeywordTypeCode, String searchKeyword) {
		return dictionaryRepository.getWordsCount(searchKeywordTypeCode, searchKeyword);
	}

	public Word getWordbyId(int id) {
		return dictionaryRepository.getWordbyId(id);
	}

	public List<Word> getWordsbyName(String name) {
		return dictionaryRepository.getWordsbyName(name);
	}

	public List<Word> RandomWordList(int level){
		return dictionaryRepository.RandomWordList(level);
	}
	
	public List<String> RandomMeanList(){
		return dictionaryRepository.RandomMeanList();
	}

	public List<String> RandomNameList(){
		return dictionaryRepository.RandomNameList();
	}



}