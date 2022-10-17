package com.kor.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//화면 구성을 위한 임시 컨트롤러들 입니다.
@Controller
public class SampleController {
    @RequestMapping("/usr/learn/wordtest1")
    public String showLearn() {
        return "usr/home/wordtest1";
    }

    @RequestMapping("/usr/learn/wordtest2")
    public String showLearn2() {
        return "usr/home/wordtest2";
    }

    @RequestMapping("/usr/learn/wordtest3")
    public String showLearn3() {
        return "usr/home/wordtest3";
    }
    
    @RequestMapping("/usr/learnControl/mypage1")
    public String showLearnControl() {
        return "usr/home/mypage1";
    }

    @RequestMapping("/usr/learnControl/mypage2")
    public String showLearnControl2() {
        return "usr/home/mypage2";
    }

    @RequestMapping("/usr/learnControl/mypage3")
    public String showLearnControl3() {
        return "usr/home/mypage3";
    }
}
