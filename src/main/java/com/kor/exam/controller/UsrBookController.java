package com.kor.exam.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.kor.exam.utill.Ut;
import com.kor.exam.vo.ResultData;
import com.kor.exam.service.BookService;
import com.kor.exam.vo.Rq;
import com.kor.exam.vo.Book;

@Controller
public class UsrBookController {
	private BookService bookService;
	private Rq rq;

	public UsrBookController(BookService bookService, Rq rq) {
		this.bookService = bookService;
		this.rq = rq;
	}


	@RequestMapping("/usr/book/list")
	public String showList(Model model,
			@RequestParam(defaultValue = "name") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {

		int BooksCount = bookService.getBooksCount(searchKeywordTypeCode, searchKeyword);

		int itemsCountInAPage = 10;
		int pagesCount = (int) Math.ceil((double) BooksCount / itemsCountInAPage);
		List<Book> books = bookService.getForPrintBooks(searchKeyword,searchKeywordTypeCode, itemsCountInAPage, page);


		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("BooksCount", BooksCount);
		model.addAttribute("books", books);

		return "usr/book/list";
	}
	
	@RequestMapping("/usr/book/detail")
	public String showDetail(Model model,@RequestParam(defaultValue = "0") int id,@RequestParam(defaultValue = "0")int ran) {
		Book book;
        if(ran==1) {
            book =bookService.GetRandomBook();
        }
        else
	    {book = bookService.getBookbyId(id);}

		model.addAttribute("book", book);
		
		return "usr/book/detail";
	}
	
}