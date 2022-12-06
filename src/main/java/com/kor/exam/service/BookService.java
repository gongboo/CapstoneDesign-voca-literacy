package com.kor.exam.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kor.exam.repository.BookRepository;
import com.kor.exam.utill.Ut;
import com.kor.exam.vo.ResultData;
import com.kor.exam.vo.Book;

@Service
public class BookService {
	private BookRepository bookRepository;

	
	public BookService(BookRepository bookRepository) {
		this.bookRepository = bookRepository;
	}

	public List<Book> getForPrintBooks(String searchKeyword,String searchKeywordTypeCode, int itemsCountInAPage, int page) {
		int limitStart = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;
		List<Book> books = bookRepository.getForPrintBooks(searchKeyword, searchKeywordTypeCode, limitStart, limitTake);
		

		return books;
	}

	public Book getBookbyId(int id) {
		Book book = bookRepository.getBookbyId(id);
		return book;
	}

	public int getBooksCount(String searchKeywordTypeCode, String searchKeyword) {
		return bookRepository.getBooksCount(searchKeywordTypeCode, searchKeyword);
	}

	public Book GetRandomBook(){
		return bookRepository.GetRandomBook();
	}



}