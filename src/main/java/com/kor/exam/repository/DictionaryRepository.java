package com.kor.exam.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kor.exam.vo.Word;
import com.kor.exam.vo.Member;

@Mapper
public interface DictionaryRepository {
	@Select("""
			<script>
			SELECT W.*,
			FROM word AS W
			WHERE W.id = #{id}
			</script>
			""")
	public Word getForPrintWord(@Param("id") int id);

	@Select("""
			<script>
				SELECT W.*
				FROM word AS W
				WHERE 1
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchKeywordTypeCode == 'name'">
							AND W.name LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordTypeCode == 'type'">
							AND W.type LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							AND (
								W.name LIKE CONCAT('%', #{searchKeyword}, '%')
								OR
								W.type LIKE CONCAT('%', #{searchKeyword}, '%')
							)
						</otherwise>
					</choose>
				</if>
				ORDER BY W.id ASC
				<if test="limitTake != -1">
					LIMIT #{limitStart}, #{limitTake}
				</if>
			</script>
			""")
	public List<Word> getForPrintWords(String searchKeyword, String searchKeywordTypeCode,
			int limitStart, int limitTake);

	public int getLastInsertId();

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM word AS W
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'name'">
						AND W.name LIKE CONCAT('%', #{searchKeyword}, '%')
					</when>
					<when test="searchKeywordTypeCode == 'type'">
						AND W.type LIKE CONCAT('%', #{searchKeyword}, '%')
					</when>
					<otherwise>
						AND (
							W.name LIKE CONCAT('%', #{searchKeyword}, '%')
							OR
							W.type LIKE CONCAT('%', #{searchKeyword}, '%')
						)
					</otherwise>
				</choose>
			</if>
			</script>
			""")
	public int getWordsCount(String searchKeywordTypeCode, String searchKeyword);

	@Select("""
			<script>
			SELECT *
			FROM word
			WHERE id = #{id}
			</script>
			""")
	public Word getWordbyId(int id);
}