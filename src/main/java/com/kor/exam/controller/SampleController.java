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
}
