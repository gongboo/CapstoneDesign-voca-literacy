package com.kor.exam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kor.exam.service.DictionaryService;
import com.kor.exam.service.MyVocaService;
import com.kor.exam.utill.Ut;
import com.kor.exam.vo.Member;
import com.kor.exam.vo.Rq;
import com.kor.exam.vo.Word;

@Controller
public class UsrMyVocaController {
	private DictionaryService dictionaryService;
	private MyVocaService myvocaService;
	private Rq rq;
	private Member member;
	
	public UsrMyVocaController(DictionaryService dictionaryService,MyVocaService myvocaService, Rq rq) {
		this.dictionaryService = dictionaryService;
		this.myvocaService = myvocaService;
		this.rq = rq;
	}


	@RequestMapping("/usr/member/myPage/word")
	public String showList(Model model,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {

		member=rq.getLoginedMember();
		int WordsCount = myvocaService.getWordsCount(searchKeywordTypeCode, searchKeyword, member.getId());

		int itemsCountInAPage = 10;
		int pagesCount = (int) Math.ceil((double) WordsCount / itemsCountInAPage);
		List<Word> words = myvocaService.getForPrintWords(searchKeyword,searchKeywordTypeCode, itemsCountInAPage, page, member.getId());


		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("WordsCount", WordsCount);
		model.addAttribute("words", words);

	
		return "usr/member/myPage/word";
	}
	
	 @RequestMapping("/usr/member/myPage/mypage2")
	    public String showMyList(Model model,
				@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
				@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {

			member=rq.getLoginedMember();
			int WordsCount = myvocaService.getWordsCount(searchKeywordTypeCode, searchKeyword, member.getId());

			int itemsCountInAPage = 10;
			int pagesCount = (int) Math.ceil((double) WordsCount / itemsCountInAPage);
			List<Word> words = myvocaService.getForPrintWords(searchKeyword,searchKeywordTypeCode, itemsCountInAPage, page, member.getId());


			model.addAttribute("page", page);
			model.addAttribute("pagesCount", pagesCount);
			model.addAttribute("WordsCount", WordsCount);
			model.addAttribute("words", words);

		
			return "usr/member/myPage/mypage2";
		}
		
	
	@RequestMapping("/usr/member/myPage/addWord")
	@ResponseBody
	public String doAddWord(int id, @RequestParam(defaultValue = "/") String afterFindLoginIdUri) {
		member = rq.getLoginedMember();
		Word word = dictionaryService.getWordbyId(id);
		myvocaService.addWord(member.getId(), word.getId());

		return rq.jsReplace(Ut.f("나만의 단어장에 %s을/를 추가하였습니다.",word.getName()), afterFindLoginIdUri);
	}
	
	@RequestMapping("/usr/member/myPage/deleteWord")
	@ResponseBody
	public String doDeleteWord(int id, @RequestParam(defaultValue = "/") String afterFindLoginIdUri) {
		member = rq.getLoginedMember();
		Word word = dictionaryService.getWordbyId(id);
		myvocaService.deleteWord(member.getId(), word.getId());

		return rq.jsReplace(Ut.f("나만의 단어장에서 %s을/를 삭제하였습니다.",word.getName()), afterFindLoginIdUri);
	}
	
}