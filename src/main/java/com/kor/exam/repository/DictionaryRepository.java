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
						<when test="searchKeywordTypeCode == 'mean'">
							AND W.mean LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							AND (
								W.name LIKE CONCAT('%', #{searchKeyword}, '%')
								OR
								W.mean LIKE CONCAT('%', #{searchKeyword}, '%')
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

//	 id int(10) not null primary key auto_increment,
//	 name char(50) not null,
//	 same_num int(10),
//	 `group` char(50),
//	 `type` char(50),
//	 origin char(50),
//	 pronun char(50),
//	 `usage` char(50),
//	 derivatice char(50),
//	 `level` char(50),
//	 category char(50),
//	 topic char(50),
//	 full_ref char(50),
//	 search_type char(50),
//	 related_word char(50),
//	 ref char(50),
//	 mean char(100),
//	 example char (100),
//	 test_cnt int(20) not null default '0',
//	 search_cnt int(20) not null default '0'
	
	@Select("""
			<script>
			SELECT W.name, group_concat(distinct W.type separator ' | ') as type, group_concat(W.mean separator ' | ') as mean
			from word as W
			WHERE 1
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchKeywordTypeCode == 'name'">
							AND W.name LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordTypeCode == 'type'">
							AND W.type LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<when test="searchKeywordTypeCode == 'mean'">
							AND W.mean LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
						<otherwise>
							AND (
								W.name LIKE CONCAT('%', #{searchKeyword}, '%')
								OR
								W.mean LIKE CONCAT('%', #{searchKeyword}, '%')
							)
						</otherwise>
					</choose>
				</if>
			    GROUP BY trim(W.name)
				ORDER BY W.id ASC
				<if test="limitTake != -1">
					LIMIT #{limitStart}, #{limitTake}
				</if>
			</script>
			""")
	public List<Word> MakeDictionary(String searchKeyword, String searchKeywordTypeCode,
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
					<when test="searchKeywordTypeCode == 'mean'">
							AND W.mean LIKE CONCAT('%', #{searchKeyword}, '%')
						</when>
					<otherwise>
						AND (
							W.name LIKE CONCAT('%', #{searchKeyword}, '%')
							OR
							W.mean LIKE CONCAT('%', #{searchKeyword}, '%')
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
	
	@Select("""
			<script>
			SELECT W.name, group_concat(distinct W.origin separator ' | ') as origin, group_concat(distinct W.type separator ' | ') as type, group_concat(W.mean separator ' | ') as mean, group_concat(W.example separator ' | ') as example
			FROM word as W
			WHERE W.name= #{name}
			GROUP BY W.name
			</script>
			""")
	public Word getWordbyName(String name);
	
}