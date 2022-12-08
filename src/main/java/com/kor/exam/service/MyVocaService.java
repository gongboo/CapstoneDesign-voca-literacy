package com.kor.exam.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.kor.exam.repository.MyVocaRepository;
import com.kor.exam.vo.Word;

@Service
public class MyVocaService {
	private MyVocaRepository myvocaRepository;

	public MyVocaService(MyVocaRepository myvocaRepository) {
		this.myvocaRepository = myvocaRepository;
	}

	public List<Word> getForPrintWords(String searchKeyword,String searchKeywordTypeCode, int itemsCountInAPage, int page,int memberId, int type) {
		int limitStart = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;

		List<Word> words = myvocaRepository.getForPrintWords(searchKeyword, searchKeywordTypeCode, limitStart, limitTake, memberId,type);


		return words;
	}

	public Word getForPrintWord(int id) {
		Word word = myvocaRepository.getWordbyId(id);

		return word;
	}

	public int getWordsCount(String searchKeywordTypeCode, String searchKeyword,int memberId,int type) {
		return myvocaRepository.getWordsCount(searchKeywordTypeCode, searchKeyword, memberId, type);
	}

	public Word getWordbyId(int id) {
		return myvocaRepository.getWordbyId(id);
	}
	
	public void addWord(int memberId, String name ,int type) {
		myvocaRepository.addWord(memberId,name,type);
	}
	
	public void deleteWord(int memberId,String name, int type) {
		myvocaRepository.deleteWord(memberId,name,type);
	}


}