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

    @RequestMapping("/imagesearch")
    @ResponseBody
    public void ocrTestFunction() {

        Mat original_image = imread("src/main/resources/static/resource/ocr_image/IMG_6423.jpeg");
        Mat hsv_image = new Mat();// hsv 이미지 수정
        cvtColor(original_image, hsv_image, COLOR_BGR2HSV);
        // cvtColor(hsv_image, hsv_image, COLOR_BGR2HSV);// imgproc 모듈 이걸로 확인함 필요없는 코드

        Mat img_mask = new Mat();// 마스크 만들기
        inRange(hsv_image, new Mat(1, 1, CV_32SC4, new Scalar(0, 50, 200, 0)),
                new Mat(1, 1, CV_32SC4, new Scalar(180, 255, 255, 0)), img_mask);

        Mat img_result = new Mat();// 마스크 and 연산
        bitwise_and(hsv_image, hsv_image, img_result, img_mask);
        // imwrite("src/main/resources/static/resource/img_result.png", img_result); //이미지 잘 나오나 확인해봄

        MatVector contours = new MatVector();
        findContours(img_mask, contours, CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE);

        long n = contours.size();
        int i = 0;
        int count=0;
        for (i = 0; i < n; i++) {
            Rect rect = boundingRect(contours.get(i));
            if (rect.width() * rect.height() < 400) {
                continue;
            }

            if (rect.width() / rect.height() > 1.5) {
                count++;
                Mat image_cropped = new Mat(original_image, rect);
                imwrite(String.format("src/main/resources/static/resource/ocr_image/example%d.png", count), image_cropped);
            }
        }

        //tesseract 시작
        Tesseract tesseract = new Tesseract();
        tesseract.setDatapath("C:\\Program Files\\Tesseract-OCR\\tessdata");

//        // 자동으로 tessdata 찾는거 이렇게 한다는데 이걸로 작동 안함
//        File tessDataFolder = LoadLibs.extractTessResources("tessdata");
//        tesseract.setDatapath(tessDataFolder.getAbsolutePath());

        tesseract.setLanguage("kor");
        for (int j = 1; j <= count; j++) {
            File file = new File(String.format("src/main/resources/static/resource/ocr_image/example%d.png", j));
            try {
                String text = tesseract.doOCR(file);
                System.out.print(text);
                file.delete();
            } catch (TesseractException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}