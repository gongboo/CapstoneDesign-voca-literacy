package com.kor.exam.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String showTest(Model model) {


		member=rq.getLoginedMember();
		List<Word> words = dictionaryService.RandomWordList(member.getLevel());
		List<String> examples1 = dictionaryService.RandomMeanList();
		List<String> examples2 = dictionaryService.RandomNameList();
		List<Question>questions = MakeQuestion(words,examples1,examples2);

	
		model.addAttribute("words", words);
		model.addAttribute("questions", questions);

        

		return "usr/home/wordtest4";
	}


	@RequestMapping(value = "/usr/learn/showResult.do", method = { RequestMethod.POST ,RequestMethod.GET})
	@ResponseBody
	public void doShowResult(Model model, @RequestParam("test_result_correct_or_not[]") List<Boolean> test_result) {
		member = rq.getLoginedMember();
//		List<Word> wordlist = new ArrayList<Word>();
//		
//		for(int i=0;i<10;i++) {
//			if(test_result.get(i)==false) {
//			wordlist.add(words.get(i));
//			myvocaService.addWord(member.getId(), words.get(i) , 1);}
//		}
		
//		model.addAttribute("words", wordlist);
		System.out.println("결과");
		System.out.println(test_result);
	//	System.out.println(words);

//		return "usr/home/showResult";
	}
	
	
	
	public List<Question> MakeQuestion(List<Word> words, List<String> examples1, List<String> examples2){
		Random random = new Random();
		List<Question>questions = new ArrayList<>();
        System.out.println(words.size());

		//null이나 문제랑 중복되면 삭제
		for(int j=0;j<words.size();j++) {
			for(int i=0;i<examples1.size();i++){
				if(examples1.get(i)==words.get(j).getMean()||examples1.get(i).isEmpty()) {
					examples1.remove(i);
				}
				if(examples2.get(i)==words.get(j).getName()||examples2.get(i).isEmpty()) {
					examples2.remove(i);
				}
			}
		}

		//문제 생성
		for(int i=0;questions.size()<10;i++) { //11로 되어 있었는데 11개 나오길래 10으로 수정함
			int snum =random.nextInt(2);
			if(words.get(i).getExample().isEmpty()) {
				snum=0;
			}
			if(words.get(i).getMean().isEmpty()) {
				snum=1;
			}
			if(words.get(i).getMean().isEmpty()&&words.get(i).getExample().isEmpty()) {
				snum=2;
			}
			switch(snum) {
				case 0: //단어의 뜻 맞추기
					int ran = random.nextInt(4);
					List<String>temp = new ArrayList<>();

					for(int j=0;j<5;j++) {
						int ran2 = random.nextInt(examples1.size()-1);
						//정답위치에 답 넣기
						if(j==ran) {
							temp.add(words.get(i).getMean());
						}
						else {
							temp.add(examples1.get(ran2));
//						    examples1.remove(ran2);
						}
					}
					Question q = new Question();
					q.setAnswer(ran);
					q.setQuestion(words.get(i).getName());
					q.setExamples(temp);
					questions.add(q);
					break;

				case 1: //예시 빈칸으로 단어 맞추기
					int ran3 = random.nextInt(4);
					List<String>temp2 = new ArrayList<>();
					for(int j=0;j<5;j++) {
						int ran2 = random.nextInt(examples1.size()-1);
						//정답위치에 답 넣기
						if(j==ran3) {
							temp2.add(words.get(i).getName());
						}
						else {
							temp2.add(examples2.get(ran2));
//						    examples2.remove(ran2);
						}
					}
					Question q2 = new Question();
					q2.setAnswer(ran3);
					String q3[]=words.get(i).getExample().split("<|>");
					String q4 = q3[0].replace(words.get(i).getName(), "[  ]");
					q2.setQuestion(q4);
					q2.setExamples(temp2);
					questions.add(q2);
					break;

				case 2: //둘 다 없으면 패스
					break;
			}
		}
		return questions;
	}

}