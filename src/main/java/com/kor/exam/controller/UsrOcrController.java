package com.kor.exam.controller;

import static org.bytedeco.opencv.global.opencv_core.CV_32SC4;
import static org.bytedeco.opencv.global.opencv_core.bitwise_and;
import static org.bytedeco.opencv.global.opencv_core.inRange;
import static org.bytedeco.opencv.global.opencv_imgcodecs.imread;
import static org.bytedeco.opencv.global.opencv_imgcodecs.imwrite;
import static org.bytedeco.opencv.global.opencv_imgproc.COLOR_BGR2HSV;
import static org.bytedeco.opencv.global.opencv_imgproc.CV_CHAIN_APPROX_SIMPLE;
import static org.bytedeco.opencv.global.opencv_imgproc.CV_RETR_LIST;
import static org.bytedeco.opencv.global.opencv_imgproc.boundingRect;
import static org.bytedeco.opencv.global.opencv_imgproc.cvtColor;
import static org.bytedeco.opencv.global.opencv_imgproc.findContours;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.bytedeco.opencv.opencv_core.Mat;
import org.bytedeco.opencv.opencv_core.MatVector;
import org.bytedeco.opencv.opencv_core.Rect;
import org.bytedeco.opencv.opencv_core.Scalar;
import org.openkoreantext.processor.KoreanTokenJava;
//형태소 분석기 okt
import org.openkoreantext.processor.OpenKoreanTextProcessorJava;
import org.openkoreantext.processor.tokenizer.KoreanTokenizer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kor.exam.service.DictionaryService;
import com.kor.exam.service.MyVocaService;
import com.kor.exam.vo.Rq;
import com.kor.exam.vo.Word;

import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import scala.collection.Seq;

@Controller
public class UsrOcrController {
	private DictionaryService dictionaryService;
	private MyVocaService myvocaService;
	private Rq rq;

	public UsrOcrController(DictionaryService dictionaryService, MyVocaService myvocaService, Rq rq) {
		this.dictionaryService = dictionaryService;
		this.myvocaService = myvocaService;
		this.rq = rq;
	}

	@RequestMapping("/usr/dictionary/pic")
	public String pic_serach() {
		return "usr/home/pictureSearch";
	}

	@RequestMapping("/imagesearch")
	public String ocrTestFunction(Model model) {

		Mat original_image = imread("/home/ubuntu/my_project/file_place/ocr_file.jpg");//"C:\\Users\\auspi\\test\\new_text_file.jpg"
		Mat hsv_image = new Mat();// hsv 이미지 수정
		cvtColor(original_image, hsv_image, COLOR_BGR2HSV);
		// cvtColor(hsv_image, hsv_image, COLOR_BGR2HSV);// imgproc 모듈 이걸로 확인함 필요없는 코드

		Mat img_mask = new Mat();// 마스크 만들기
		inRange(hsv_image, new Mat(1, 1, CV_32SC4, new Scalar(0, 50, 200, 0)),
				new Mat(1, 1, CV_32SC4, new Scalar(180, 255, 255, 0)), img_mask);

		Mat img_result = new Mat();// 마스크 and 연산
		bitwise_and(hsv_image, hsv_image, img_result, img_mask);
		// imwrite("src/main/resources/static/resource/img_result.png", img_result);
		// //이미지 잘 나오나 확인해봄

		MatVector contours = new MatVector();
		findContours(img_mask, contours, CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE);

		long n = contours.size();
		int i = 0;
		int count = 0;
		for (i = 0; i < n; i++) {
			Rect rect = boundingRect(contours.get(i));
			if (rect.width() * rect.height() < 400) {
				continue;
			}

			if (rect.width() / rect.height() > 1.5) {
				count++;
				Mat image_cropped = new Mat(original_image, rect);
				imwrite(String.format("src/main/resources/static/resource/ocr_image/example%d.png", count),
						image_cropped);
			}
		}
		
        //tesseract 시작
        Tesseract tesseract = new Tesseract();
        //tesseract.setDatapath("C:\\Program Files\\Tesseract-OCR\\tessdata");
        tesseract.setDatapath("\\usr\\share\\tesseract-ocr\\4.00\\tessdata");


//        // 자동으로 tessdata 찾는거 이렇게 한다는데 이걸로 작동 안함
//        File tessDataFolder = LoadLibs.extractTessResources("tessdata");
//        tesseract.setDatapath(tessDataFolder.getAbsolutePath());

		List<Word> words = new ArrayList<>();
		List<String> texts = new ArrayList<>();
		tesseract.setLanguage("kor");
		for (int j = 1; j <= count; j++) {
			File file = new File(String.format("src/main/resources/static/resource/ocr_image/example%d.png", j));
			try {
				String text = tesseract.doOCR(file);
				texts.add(text.replaceAll("[\\r\\n|\\r|\\n|\\n\\r]", ""));
				System.out.print(text);
				file.delete();
			} catch (TesseractException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		for (int j = 0; j < texts.size(); j++) {
			List<Word> temp = dictionaryService.getWordsbyName(texts.get(j));
			for (int k = 0; k < temp.size(); k++)
				words.add(temp.get(k));
		}

		int WordsCount = words.size();


		model.addAttribute("words", words);
		model.addAttribute("WordsCount", WordsCount);
		model.addAttribute("texts", texts);

		return "usr/home/pictureSearch2";

	}
	
	
	List<String> getProcessedKoreansList(String input_string) {
		String textall = "한국어를 처리하는 예시입니닼ㅋㅋㅋㅋ";
		// Normalize
		CharSequence normalized = OpenKoreanTextProcessorJava.normalize(input_string);
		// Tokenize
		Seq<KoreanTokenizer.KoreanToken> tokens = OpenKoreanTextProcessorJava.tokenize(normalized);
		List<String> text_lists = new ArrayList<String>();
		List<KoreanTokenJava> tokenLists = OpenKoreanTextProcessorJava.tokensToJavaKoreanTokenList(tokens);

		for (int i = 0; i < tokenLists.size(); i++) {
			text_lists.add(tokenLists.get(i).getText());
			if (tokenLists.get(i).getStem() != "") {
				text_lists.add(tokenLists.get(i).getStem());
			}
		}
		return text_lists;
	}
}