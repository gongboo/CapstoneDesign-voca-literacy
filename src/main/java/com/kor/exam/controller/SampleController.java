package com.kor.exam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kor.exam.vo.Word;

//화면 구성을 위한 임시 컨트롤러들 입니다.
@Controller
public class SampleController {
    @RequestMapping("/usr/learn/wordtest1")
    public String showLearn() {
        return "usr/home/wordtest1";
    }

//    @RequestMapping("/usr/learn/wordtest2")
//    public String showLearn2() {
//        return "usr/home/wordtest2";
//    }

    @RequestMapping("/usr/learn/wordtest3")
    public String showLearn3() {
        return "usr/home/wordtest3";
    }

    @RequestMapping("/usr/learn/shortTextRead")
    public String showLearnTextRead() {
        return "usr/home/shortTextRead";
    }
    
    @RequestMapping("/usr/learn/wordtest_wrong")
    public String showTestWrong() {
        return "usr/home/wordtest_wrong";
    }

    @RequestMapping("/usr/member/myPage/mypage1")
    public String showLearnControl() {
        return "usr/member/myPage/mypage1";
    }



    @RequestMapping("/usr/member/myPage/mypage3")
    public String showLearnControl3() {
        return "usr/member/myPage/mypage3";
    }
    
    @RequestMapping("usr/dictionary/pic")
    public String showPicSearch() {
        return "usr/home/pictureSearch";
    }

}

