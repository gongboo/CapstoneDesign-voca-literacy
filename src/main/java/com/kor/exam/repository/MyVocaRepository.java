package com.kor.exam.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kor.exam.vo.Word;

@Mapper
public interface MyVocaRepository {
	@Select("""
			<script>
			SELECT V.*,
			FROM MyVoca AS V
			WHERE V.id = #{id}
			</script>
			""")
	public Word getForPrintWord(@Param("id") int id);

	@Select("""
			<script>
				SELECT W.*
				FROM MyVoca AS V
			    LEFT JOIN word AS W
			    ON V.wordId = W.id
				WHERE V.memberId = #{memberId}
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
				ORDER BY W.id DESC
				<if test="limitTake != -1">
					LIMIT #{limitStart}, #{limitTake}
				</if>
			</script>
			""")
	public List<Word> getForPrintWords(String searchKeyword, String searchKeywordTypeCode,
			int limitStart, int limitTake,int memberId);

	public int getLastInsertId();

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM MyVoca AS V
		    LEFT JOIN word AS W
		    ON V.wordId = W.id
			WHERE V.memberId = #{memberId}
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
	public int getWordsCount(String searchKeywordTypeCode, String searchKeyword,int memberId);

	@Select("""
			<script>
			SELECT *
			FROM word
			WHERE id = #{id}
			</script>
			""")
	public Word getWordbyId(int id);
	
	@Insert("""
			<script>
			INSERT INTO MyVoca
			SET regDate = NOW(),
			updateDate = NOW(),
			memberId = #{memberId},
			wordId = #{wordId}
			</script>
			""")
	public void addWord(int memberId, int wordId);
	
	@Delete("""
			<script>
			Delete FROM MyVoca
			where memberId = #{memberId} and wordId = #{wordId}
			</script>
			""")
	public void deleteWord(int memberId, int wordId);
	
}