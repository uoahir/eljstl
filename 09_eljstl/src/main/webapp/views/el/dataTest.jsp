<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>서버(Servlet 저장)에서 전송한 데이터 출력하기</h3>
	<h4>${animal }</h4>
	<ul>
		<li>이름 : ${animal.name }</li>
		<li>나이 : ${animal.age }</li>
		<li>몸무게 : ${animal.weight }</li>
		<li>성별 : ${animal.gender }</li>
	</ul>
	<h4>${animals }</h4>
	
	<p>${animals.get(0).name } ${animals.get(0).age }</p>
	<p>${animals.get(1).name } ${animals.get(1).age }</p>
	<h4>${mapAnimal }</h4>
	<div>
		${animals.stream().map(e->e.getName()).toList() }
	</div>
	
	<h3>request, session, application 에 동일한 key 로 저장된 데이터가 있는 경우</h3>
	<h4>${data }</h4>
	<h3>각 객체에 접근해서 데이터 가져오기</h3>
	<p>
		requestScope, sessionScope, applicationScope 예약어 이용
	</p>
	<h4>requestScope.data ${requestScope.data }</h4>
	<h4>sessionScope.data ${sessionScope.data }</h4>
	<h4>applicationScope.data ${applicationScope.data }</h4>
	
	<h4>sessionScope.data ${sessionScope.animals }</h4>
	
	<h3>파라미터 데이터 접근하기</h3>
	<p>param, paramValues 예약어 제공</p>
	<h4>파라미터 : ${title }</h4>
	<h4>파라미터 : ${param.title }</h4>
	
	<h4>아이디 : ${param.userId }</h4>
	<h4>비밀번호 : ${param.password }</h4>
	<h4>취미 : ${paramValues.hobby[0] } ${paramValues.hobby[1] } ${paramValues.hobby[2] }</h4>
	
	<h4>${Arrays.asList(paramValues.hobby) }</h4>
</body>
</html>