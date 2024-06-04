<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action 태그 활용하기</title>
</head>
<body>	
	<h2>액션태그 활용하기</h2>
	<p>
		jsp 페이지에서 java 코드를 html 태그 방식으로 작성할 수 있게 해주는 태그
	</p>
	<ul>
		<li>표준액션태그 : 기본 jsp 에서 제공하는 태그들 태그의 접두어로 jsp 를 이용</li>
		<li>커스텀액션태그 : 별도의 jar 를 이용해서 사용하는 태그들</li>
	</ul>
	
	<h3>표준액션태그 -> jsp: include 태그 이용하기</h3>
	<p>
		다른 jsp 페이지를 불러올 때 사용하는 태그, page 속성을 이용해서 불러올 페이지를 지정
		<%-- <%@ include %> 와 유사함 --%>
	</p>
	<a href="<%=request.getContextPath()%>/views/includeTest.jsp">
		jsp : include 테스트
	</a>
	<h3>EL표현식 알아보기</h3>
	<p>
		<%-- <%= %> --%>
		<%-- ${ } --%> -> 화면에 출력할 내용을 작성 
		-> request, session, application 에 저장된 데이터를 출력할 때 사용함.
		자동으로 위 객체를 탐색해서 데이터를 가져옴.
		자동으로 형변환을 해줌.
		DTO 객체일 경우 getter 메소드를 자동으로 호출해줌 -> 필드명만 작성하면 됨.
		EL 내부에는 연산처리(산술, 비교, 논리, 삼항), 메소드 호출
	</p>
	<a href="${pageContext.request.contextPath }/views/el/elTest.jsp">
		EL 사용하기
	</a>
	
	<h3>JSTL 사용하기</h3>
	<p>
		apache 재단에서 만든 jsp 커스텀태그 라이브러리
		1. 구현된 jar 파일 가져오기
		2. 적용할 페이지에 선언을 해야 함 -> <%-- <%@ taglib %> --%>
	</p>
	<h4>
		<a href="${pageContext.request.contextPath }/views/jstl/01_core.jsp">
			JSTL 이용하기
		</a>
			
	</h4>
</body>
</html>