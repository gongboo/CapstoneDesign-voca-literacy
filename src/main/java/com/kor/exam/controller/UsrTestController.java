package com.kor.exam.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kor.exam.service.DictionaryService;
import com.kor.exam.service.MyVocaService;
import com.kor.exam.vo.Member;
import com.kor.exam.vo.Question;
import com.kor.exam.vo.Rq;
import com.kor.exam.vo.Word;

@Controller
public class UsrTestController {
	private DictionaryService dictionaryService;
	private MyVocaService myvocaService;
	private Rq rq;
	private Member member;
	
	public UsrTestController(DictionaryService dictionaryService,MyVocaService myvocaService, Rq rq) {
		this.dictionaryService = dictionaryService;
		this.myvocaService = myvocaService;
		this.rq = rq;
	}


	@RequestMapping("/usr/learn/wordtest2")
	public String showTest(Model model,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {

		
		member=rq.getLoginedMember();
		List<Word> words = dictionaryService.RandomWordList();
		List<String> examples = dictionaryService.RandomMeanList();
		List<Question>questions = new ArrayList<>();
		Random random = new Random();

		for(int j=0;j<words.size();j++) {
			for(int i=0;i<examples.size();i++){
			if(examples.get(i)==words.get(j).getMean()||examples.get(i).isEmpty()) {
			examples.remove(i--);
			}
			}
		}
		for(int i=0;i<words.size();i++) {
			int ran = random.nextInt(4);
			List<String>temp = new ArrayList<>();
			for(int j=0;j<5;j++) {
				int ran2 = random.nextInt(examples.size()-1);
				if(j==ran) {
					temp.add(words.get(i).getMean());
				}
				else temp.add(examples.get(ran2));
			}
			Question q = new Question();
			q.setAnswer(ran);
			q.setWord(words.get(i));
			q.setExamples(temp);
			questions.add(q);
		}
	
		
		model.addAttribute("words", words);
		model.addAttribute("questions", questions);


	
		return "usr/home/wordtest4";
	}

	

}