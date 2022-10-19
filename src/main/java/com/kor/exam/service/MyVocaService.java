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

	public List<Word> getForPrintWords(String searchKeyword,String searchKeywordTypeCode, int itemsCountInAPage, int page,int memberId) {
		int limitStart = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;

		List<Word> words = myvocaRepository.getForPrintWords(searchKeyword, searchKeywordTypeCode, limitStart, limitTake, memberId);


		return words;
	}

	public Word getForPrintWord(int id) {
		Word word = myvocaRepository.getWordbyId(id);

		return word;
	}

	public int getWordsCount(String searchKeywordTypeCode, String searchKeyword,int memberId) {
		return myvocaRepository.getWordsCount(searchKeywordTypeCode, searchKeyword, memberId);
	}

	public Word getWordbyId(int id) {
		return myvocaRepository.getWordbyId(id);
	}
	
	public void addWord(int memberId, int wordId) {
		myvocaRepository.addWord(memberId,wordId);
	}
	
	public void deleteWord(int memberId, int wordId) {
		myvocaRepository.deleteWord(memberId,wordId);
	}


}