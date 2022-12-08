package com.kor.exam.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kor.exam.vo.Word;
import com.kor.exam.vo.Book;

@Mapper
public interface BookRepository {
	@Select("""
			<script>
			SELECT *
			FROM Book AS B
			WHERE B.id = #{id}
			</script>
			""")
	public Book getBookbyId(int id);

	@Select("""
			<script>
				SELECT B.*
				FROM book AS B
				WHERE 1
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchKeywordTypeCode == 'title'">
							AND W.title LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordTypeCode == 'writer'">
							AND W.writer LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							AND (
								W.title LIKE CONCAT('%', #{searchKeyword}, '%')
								OR
								W.writer LIKE CONCAT('%', #{searchKeyword}, '%')
							)
						</otherwise>
					</choose>
				</if>
				<if test="limitTake != -1">
					LIMIT #{limitStart}, #{limitTake}
				</if>
			</script>
			""")
	public List<Book> getForPrintBooks(String searchKeyword, String searchKeywordTypeCode,
									   int limitStart, int limitTake);


	public int getLastInsertId();

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM book AS B
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND W.title LIKE CONCAT('%', #{searchKeyword}, '%')
					</when>
					<when test="searchKeywordTypeCode == 'writer'">
						AND W.writer LIKE CONCAT('%', #{searchKeyword}, '%')
					</when>
					<otherwise>
						AND (
							W.title LIKE CONCAT('%', #{searchKeyword}, '%')
							OR
							W.writer LIKE CONCAT('%', #{searchKeyword}, '%')
						)
					</otherwise>
				</choose>
			</if>
			</script>
			""")
	public int getBooksCount(String searchKeywordTypeCode, String searchKeyword);



	@Select("""
			<script>
			SELECT *
			FROM book
			ORDER BY RAND() LIMIT 1
			</script>
			""")
	public Book GetRandomBook();



}