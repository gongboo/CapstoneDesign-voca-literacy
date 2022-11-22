package com.kor.exam.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

// import org.opencv.core.Core;
// import org.opencv.core.Mat;
// import org.opencv.core.MatOfByte;
// import org.opencv.core.MatOfPoint;
// import org.opencv.core.Rect;
// import org.opencv.core.Scalar;
// import org.opencv.imgcodecs.Imgcodecs;
//import org.opencv.imgproc.Imgproc;

import org.openkoreantext.processor.KoreanTokenJava;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kor.exam.vo.Word;

// //ocr에 필요한 부분
// import java.io.File;
// import net.sourceforge.tess4j.*;
// // import net.sourceforge.tess4j.Tesseract;
// // import net.sourceforge.tess4j.TesseractException;
// //import org.opencv.core.Core;
//import org.opencv.core.*;
import java.io.File;
import java.net.URL;
import org.bytedeco.javacv.*;
import org.bytedeco.javacpp.*;
import org.bytedeco.javacpp.indexer.*;
import org.bytedeco.opencv.opencv_core.*;
import org.bytedeco.opencv.opencv_imgproc.*;
import org.bytedeco.opencv.opencv_calib3d.*;
import org.bytedeco.opencv.opencv_objdetect.*;
import static org.bytedeco.opencv.global.opencv_core.*;
import static org.bytedeco.opencv.global.opencv_imgproc.*;
import static org.bytedeco.opencv.global.opencv_calib3d.*;
import static org.bytedeco.opencv.global.opencv_objdetect.*;
import static org.bytedeco.opencv.global.opencv_imgcodecs.*;

//tesseract부분
// import net.sourceforge.tess4j.Tesseract;
// import net.sourceforge.tess4j.TesseractException;
import net.sourceforge.tess4j.*;
import net.sourceforge.tess4j.util.LoadLibs;

//형태소 분석기 okt
import org.openkoreantext.processor.OpenKoreanTextProcessorJava;
import org.openkoreantext.processor.phrase_extractor.KoreanPhraseExtractor;
import org.openkoreantext.processor.tokenizer.KoreanTokenizer;
import scala.collection.Seq;
import java.util.ArrayList;

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


}