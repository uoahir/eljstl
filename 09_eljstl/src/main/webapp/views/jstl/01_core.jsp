<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.el.model.dto.*"%>
<!-- jstl 코어태그만 쓰겠당~ -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 페이지 설정이기 때문에 페이지마다 별도로 설정해줘야한당! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jstl 태그 이용하기</h2>
	<p>
		prefix:태그명 속성="속성값"
		core: 자바로직을 구성하는 태그들을 가지고 있음 -> 변수저장, 변수출력, 조건문, 반복문
		format: 숫자, 문자에 대한 출력 패턴을 작성하는 태그
	</p>
	<c:out value="안녕"></c:out>
	<fmt:formatNumber value="1000000"></fmt:formatNumber>
	
	<h3>set/out 태그 이용하기</h3>
	<p>
		set : 공용객체(request, session, application)에 특정값을 저장하는 태그<br>
		out : 자바 데이터를 출력하는 태그(공용객체에 저장된 데이터, 리터럴)<br>
	</p>
	<ul>
		c:set태그 속성
		<li>var : key값(변수명)</li>
		<li>value : value값(리터럴, EL표현식)</li>
		<li>scope : 값이 저장된 위치를 저장</li>	
	</ul>
	<ul>
		c:out태그 속성
		<li>value : 출력될 값(리터럴, EL표현식)</li>
		<li>default : 출력될 데이터가 없는 경우 출력될 값</li>
		<li>escapeXml : value 에 저장된 값이 html 방식일 때 html로 해석할지, 문자열로 해석할지 설정</li>
	</ul>
	
	<h3>변수 선언하기</h3>
	<c:set var="comment" value="점심마싯게먹엇나요₩?"/>
	<p>${comment }</p>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<p>${path }</p>
	<c:set var="test" value="requestData" scope="request"/>
	<c:set var="test" value="sessionData" scope="session"/>
	<c:set var="test" value="contextData" scope="application"/>
	<p>${test }</p>
	<p>${requestScope.test }</p>
	<p>${sessionScope.test }</p>
	<p>${applicationScope.test }</p>
	
	<c:out value="저녁머먹을까용?"/>
	<c:out value="${path }" />
	<h4>
		<c:out value="${test }"/>
		<c:out value="${test2 }" default="업당"/>
		${test2 == null? "영구읎다":test2 }
	</h4>
	
	<c:set var="testData" value="<script>location.assign('http://www.naver.com');</script>"/>
	<c:out value="<h2>안녕하세요저는애이치티앰앨에요</h2>" escapeXml="false"/>
	
	
	<h3>url 주소를 저장하는 태그</h3>
	<c:url value="http://search.naver.com/search.naver" var="n">
		<c:param name="query" value="최헌수"/>
	</c:url>
	
	<a href="${n }">최헌수</a>
	
	<h2>조건문 활용하기</h2>
	<h3>조건문 태그 : c:if, c:choose)</h3>
	<p>자바에서 if 문을 사용하는 것과 동일함</p>
	<ul>c:if태그 속성
		<li>test: 조건식 -> true || false 를 갖는 값(리터럴, EL 표현식)</li>
		<li>var: key 값, test 의 결과를 저장</li>
	</ul>
	<c:set var="su" value="15"/>
	<c:set var="su2" value="20"/>
	<c:if test="${su < su2 }">
		<p>su가 크다 ! ! !</p>
	</c:if>
	<!-- 태그에는 if 밖에 없음 !! ! -->
	<% 
		List<String> names = List.of("유병승","김클래스","김주환","유지히","김지연지각");
		request.setAttribute("names",names);
	%>
	<%-- <c:if test="${names!=null }"> --%>
	<c:if test="${not empty names }">
		<c:if test="${su>10 }">
			<h3><c:out value="${names.get(0) }"/></h3>
		</c:if>
		<h2>이름 저장되어있다 . . ! </h2>
	</c:if>
	
	<ul>c:choose태그
		<li>자식태그로 c:when 태그를 갖는다 . . 
			<ol>c:when 태그 속성
				<li>test : 조건식 -> true || false</li>
			</ol>
		</li>
		<li>자식태그로 c:otherwise 태그를 갖는다. -> else와 같은 구문	</li>
	</ul>
	
	<c:choose>
		<c:when test="${su>20 }">
			<h2>su는 20보다 크다</h2>
		</c:when>
		<c:when test="${empty names } ">
			<h2>names비엇다</h2>
		</c:when>
		<c:otherwise>
			<h2>아무것도 해다앙ㄴ댐</h2>
		</c:otherwise>
	</c:choose>
	
	<h3>반복문 사용하기</h3>
	<p>c:forEach태그</p>
	<p>
		1. 기본반복문 : i를 순차적으로 출력하는 반복문 <br>
		2. 리스트, 배열 저장소의 값을 순회하는 반복문(foreach) <br>
	</p>
	<ul>c:forEach 태그 속성
		<li>var : 값을 저장하는 변수명</li>
		<li>begin : 시작번호</li>
		<li>end : 끝번호</li>
		<li>step : 증가번호</li>
		<li>items : EL 표현식으로 배열, 리스트 등의 데이터 설정</li>
		<li>varStatus : 반복문에 대한 정보르 가지고 있는 객체명(index, 반복횟수, 처음, 마지막을 제공)</li>
	</ul>
	<h3>1~10까지 출력하기</h3>
	<c:forEach var="i" begin="1" end="10" step="1">
		<p><c:out value="${i }"/></p>
	</c:forEach>
	<c:forEach var="i" begin="1" end="6" step="1">
		<h${i }>우와신기하다</h${i }>
	</c:forEach>
	<ul>
		<c:forEach var="name" items="${names }" varStatus="vs">
			<c:if test="${vs.first } || ${vs.last }">
				<li>
					<c:out value="${name }"/>
					<c:out value="${vs.index } ${vs.count } ${vs.first } ${vs.last }"/>
				</li>
			</c:if>
		</c:forEach>
	</ul>
	<%
		List<Snack> snacks = List.of(
				Snack.builder().type("초콜렛").name("투유").price(1200).company("빙그레").build(),
				Snack.builder().type("초콜렛").name("가나").price(1300).company("롯데").build(),
				Snack.builder().type("젤리").name("마이구미").price(1000).company("롯데").build(),
				Snack.builder().type("사탕").name("알사탕").price(2300).company("해태").build());
		request.setAttribute("snacks", snacks);
	%>
	
	<c:if test="${not empty snacks }">
		<table>
		<thead>
			<th>종류</th>
			<th>이름</th>
			<th>가격</th>
			<th>제조사</th>
		</thead>
		<tbody>
			<c:forEach var="snack" items="${snacks }" varStatus="vs">
				<tr style="background-color:${vs.first||vs.last?'lime':'lightgrey'}">
					<td><c:out value="${snack.type }"/></td>
					<td><c:out value="${snack.name }"/></td>
					<td><c:out value="${snack.price }"/></td>
					<td><c:out value="${snack.company }"/></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</c:if>
	<c:forTokens var="h" items="운동,코딩,독서,먹기,등산" delims=",">
		<p><c:out value="${h }"/></p>
	</c:forTokens>
	
	<h4>그 외 코어태그</h4>
	<c:import url="/views/common/header.jsp" var="myheader">
	
		<c:param name="title" value="importtest"/>
		<c:param name="image" value=""/>
	</c:import>
	
	<c:out value="${myheader }" escapeXml="false"/>
	<%-- <c:catch var="">
		
	</c:catch> --%>
	
	<%
		String test = null;
	%>
	<c:catch var="e">
		<%=test.length() %>
	</c:catch>
	<c:out value = "${e }"/>
</body>
</html>