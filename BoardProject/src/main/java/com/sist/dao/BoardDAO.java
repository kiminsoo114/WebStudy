package com.sist.dao;
import java.util.*;
import java.sql.*;
public class BoardDAO {
   // 연결 객체 
   private Connection conn;
   // SQL 전송 객체 
   private PreparedStatement ps;
   // URL
   private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
   
    // 1. 드라이버 등록 => 싱글턴 (한번만 호출 => 생성자) : 멤버변수 초기화 , 드라이버 등록 , 서버연결
   public BoardDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   // 클래스의 정보를 읽어 온다 (리플렉션)
		   // 클래스 메모리 활동 
		   // 메소드 제어 , 멤버변수 제어 , 생성자 ... => 스프링 (클래스 관리)
		   // 등록시에 반드시 (패키지.클래스명)
	   }catch(ClassNotFoundException cf)
	   {
		   System.out.println(cf.getMessage());
	   }
   }
   // 2. 오라클 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
		   // 오라클로 전송 => conn hr/happy
	   }catch(Exception ex) {}
   }
   // 3. 오라클 닫기
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
		   // 오라클로 전송 => exit
	   }catch(Exception ex) {}
   }
   
   // 4.기능 
   // 4-1 . 목록 ==> 페이지 (인라인뷰)
   public List<BoardVO> boardListData(int page)
   {
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   try
	   {
		   // 1. DB연결 
		   getConnection();
		   // 2. SQL문장 제작 
		   String sql="SELECT no,subject,name,regdate,hit,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				     +"FROM (SELECT /*+ INDEX_DESC(jspBoard jb_no_pk)*/no,subject,name,regdate,hit "
				     +"FROM jspBoard)) "
				     +"WHERE num BETWEEN ? AND ?";
		   //  인라인뷰 / INDEX_ASC() / INDEX_DESC()
		   /*
		    *   1page => 1~10
		    *   2page => 11~20
		    *            21
		    *            31
		    */
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   
		   // 3. SQL문장 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다 
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   
		   // 5. 실행 요청 => 결과값을 메모리에 저장 
		   ResultSet rs=ps.executeQuery();
		   // 6. 메모리에 저장된 값을 List이동 
		   while(rs.next()) // 한줄씩 읽어 온다 
		   {
			  BoardVO vo=new BoardVO();
			  vo.setNo(rs.getInt(1));
			  vo.setSubject(rs.getString(2));
			  vo.setName(rs.getString(3));
			  vo.setRegdate(rs.getDate(4));
			  vo.setHit(rs.getInt(5));
			  list.add(vo);
		   }
		   rs.close();
				     
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return list;
   }
   // 4-2 . 총페이지 구하기
   /*
    *   결과값 (리턴형) 
    *   1. 목록 => List
    *   2. 상세보기 => VO 
    *   3. 총페이지, 갯수 => int
    *   4. 찾기 => List
    *   
    *   매개변수 
    *   1. 목록 (페이지) => int
    *   2. 추가 => VO
    *   3. 수정 => VO
    *   4. 찾기 => String 
    *   5. 상세보기 => int 
    */
   public int boardTotalPage()
   {
	   int total=0;
	   try
	   {
		   // 1. 연결
		   getConnection();
		   // 2. SQL
		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM jspBoard";
		   // 3. 오라클로 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행요청 
		   ResultSet rs=ps.executeQuery();
		   // 5. 출력위치에 커서 이동 
		   rs.next();
		   // 6. 커서가 있는 데이터 읽기
		   total=rs.getInt(1);
		   // 7. 메모리 종료
		   rs.close();
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return total;
   }
   // 4-3 . 글쓰기 ==> INSERT (Primary Key)
   // 4-4 . 내용보기 ==> 조회수 증가 , 실제 상세 보기 
   public BoardVO boardDetailData(int no)
   {
	   BoardVO vo=new BoardVO();
	   try
	   {
		   //1. 연결
		   getConnection();
		   // 조회수 증가 
		   String sql="UPDATE jspBoard SET "
				     +"hit=hit+1 "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   // 실행 
		   ps.executeUpdate();
		   
		   // 실제 데이터 읽기 
		   sql="SELECT no,name,subject,content,regdate,hit "
			  +"FROM jspBoard "
			  +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   // 실행 요청
		   ResultSet rs=ps.executeQuery();
		   // 메모리(rs)에 데이터를 vo에 채워준다 
		   rs.next();
		   vo.setNo(rs.getInt(1));
		   vo.setName(rs.getString(2));
		   vo.setSubject(rs.getString(3));
		   vo.setContent(rs.getString(4));
		   vo.setRegdate(rs.getDate(5));
		   vo.setHit(rs.getInt(6));
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return vo;
   }
   // 4-5 . 수정 데이터 읽기 
   ////////////////////// => 비밀번호 검사 
   // 4-6 . 실제 수정 ==>  UPDATE 
   // 4-7 . 삭제 ==> DELETE
   
}









