package com.kor.exam.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.kor.exam.utill.Ut;
import com.kor.exam.vo.ResultData;
import com.kor.exam.service.DictionaryService;
import com.kor.exam.vo.Rq;
import com.kor.exam.vo.Word;

@Controller
public class UsrDictionaryController {
	private DictionaryService dictionaryService;
	private Rq rq;

	public UsrDictionaryController(DictionaryService dictionaryService, Rq rq) {
		this.dictionaryService = dictionaryService;
		this.rq = rq;
	}


	@RequestMapping("/usr/dictionary/list")
	public String showList(Model model,
			@RequestParam(defaultValue = "name") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {
        
	    int memberId = rq.getLoginedMemberId();
        int search=0;
        if(!searchKeyword.equals("")){//검색할때
        	search=1;
        }
		int WordsCount = dictionaryService.getWordsCount(searchKeywordTypeCode, searchKeyword);
        
		int itemsCountInAPage = 10;
		int pagesCount = (int) Math.ceil((double) WordsCount / itemsCountInAPage);
		List<Word> words = dictionaryService.getForPrintWords(searchKeyword,searchKeywordTypeCode, itemsCountInAPage, page, search,memberId);


		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("WordsCount", WordsCount);
		model.addAttribute("words", words);

		return "usr/dictionary/list";
	}
	
	@RequestMapping("/usr/dictionary/detail")
	public String showDetail(Model model, String name) {

	    Word word = dictionaryService.getWordbyName(name);

		model.addAttribute("word", word);
		
		return "usr/dictionary/detail";
	}
}