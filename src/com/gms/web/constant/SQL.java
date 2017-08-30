package com.gms.web.constant;

public class SQL {	
	public static final String MEMBER_INSERT=
			String.format(
			"INSERT INTO %s(%s,%s,%s,%s,%s,%s,%s,%s)"
					+"VALUES(?,?,?,?,?,?,?,SYSDATE)",
				DB.TABLE_MEMBER,
				DB.MEMBER_ID,
				DB.MEMBER_NAME,
				DB.MEMBER_PASSWORD,
				DB.MEMBER_SSN,
				DB.PHONE,
				DB.EMAIL,
				DB.PROFILE,
				DB.MEMBER_REGDATE);
	public static final String MEMBER_LIST=String.format("SELECT * FROM %s",DB.TABLE_MEMBER);
	public static final String MEMBER_FINDBYNAME=String.format("SELECT * FROM %s WHERE %s=?",DB.TABLE_MEMBER,DB.MEMBER_NAME);
	public static final String MEMBER_FINDBYID=String.format("SELECT * FROM %s WHERE %s=?", DB.TABLE_MEMBER,DB.MEMBER_ID);
	public static final String MEMBER_COUNT=String.format("SELECT COUNT(*) AS count FROM %s", DB.TABLE_MEMBER);
	public static final String MEMBER_UPDATE=String.format("UPDATE %s SET %s=? 	WHERE %s=?", DB.TABLE_MEMBER,DB.PASSWORD,DB.MEMBER_ID);
	public static final String MEMBER_DELETE=String.format("DELETE FROM %s WHERE %s=?", DB.TABLE_MEMBER,DB.MEMBER_ID);
	public static final String ARTICLE_COUNT=String.format("SELECT COUNT(*) AS count FROM %s", DB.TABLE_ARTICLE);
	public static final String ARTICLE_LIST=String.format("SELECT * FROM %s",DB.TABLE_ARTICLE);
	public static final String ARTICLE_FINDBYID=String.format("SELECT * FROM %s WHERE id=?", DB.TABLE_ARTICLE);
	public static final String ARTICLE_INSERT=String.format("INSERT INTO %s(%s,%s,%s,%s,%s,%s)VALUES(article_seq.nextval,?,?,?,0,SYSDATE)",
			DB.TABLE_ARTICLE,DB.ARTICLE_SEQ,DB.MEMBER_ID,DB.TITLE,DB.ARTICLE_CONTENT,DB.ARTICLE_HITCOUNT,DB.ARTICLE_REGDATE	);
	public static final String ARTICLE_FINDBYSEQ= String.format("SELECT * FROM %s WHERE %s=?", DB.TABLE_ARTICLE, DB.ARTICLE_SEQ);
	public static final String BOARD_UPDATE= String.format("UPDATE %s SET %s=?,%s=? WHERE %s=?", DB.TABLE_ARTICLE,DB.TITLE,DB.ARTICLE_CONTENT,DB.ARTICLE_SEQ);
	public static final String BOARD_DELETE= String.format("DELETE FROM %s WHERE %s=?", DB.TABLE_ARTICLE,DB.ARTICLE_SEQ);
	public static final String MAJOR_INSERT=String.format("INSERT INTO %s(%s,%s,%s,%s) VALUES(?,?,?,?)",DB.TABLE_MAJOR,
				DB.MAJOR_ID,DB.TITLE,DB.MEMBER_ID,DB.SUBJ_ID);
	/*public static final String STUDENT_LIST=
			" SELECT t2.* "
			+" FROM (SELECT ROWNUM seq,t.* "
			 +" FROM (SELECT * "
			  +" FROM student "
			  +" ORDER BY num DESC) t) t2 "
			+" WHERE t2.seq BETWEEN ? AND ? ";*/
	
	public static final String STUDENT_LIST=String.format("select t.* from (select rownum rnum, s.* from test s)t where t.rnum between ? and ?");
	public static final String STUDENT_COUNT=
		String.format(
			"SELECT COUNT(*) AS count FROM %s WHERE %s like ?",
				DB.TABLE_STUDENT,"name");
	public static final String STUDENT_FINDBYNAME=
			String.format(
					"SELECT * FROM test WHERE %s like ?",
					"name");
}













