<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.el.model.dto.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL표현식 사용하기</title>
</head>
<body>
	<h3>EL표현식 활용하기</h3>
	<p>
		1. java 데이터를 화면에 출력하는 용도로 사용 <br>
			-> java 데이터의 대상(request, session, application 에 저장된) key 값을 이용해서 출력<br>
		2. 기본문구를 출력할 때 사용 <br>
		3. 데이터 연산 후 출력할 때 사용 <br>
	</p>
	<h2>리터럴값 출력하기</h2>
	<h4>오랜만에수업하니까좋다신난다</h4>
	<h4><%="오랜만에수업하니까좋다신난다" %></h4>
	<h4>${"오랜만애수업하니까좋다신난다" }</h4>
	<%
		String name = "유병승";
		request.setAttribute("name",name);
	%>
	<h4><%=name %></h4>
	<h4>EL ${name }</h4>
	<p>
		EL은 request, session, application에 저장된 데이터나 
		parameter로 전달된 데이터를 출력할 수 있다.
	</p>
	
	<%
		request.setAttribute("request", "requestData");
		session.setAttribute("session", "sessionData");
		application.setAttribute("servletContext", "servletContextData");
	%>
	
	<h4><%=request.getAttribute("request") %></h4>
	<h4>${request }</h4>
	<h4>${session }</h4>
	<h4>${servletContext }</h4>
	<p>EL 가져온 데이터는 자동으로 형변환이 됨</p>
	<h4>${request.length() }</h4>
	
	<h3>저장된 객체 데이터 가져오기</h3>
	<p>request, session, servletcontext에 저장된 DTO를 출력하기</p>
	
	<%
		Animal a = Animal.builder().name("오순").age(2).weight(16.3).gender("여").build();
		request.setAttribute("animal",a);
		List<Animal> animals = List.of(
				a,
				Animal.builder().name("오복이").age(1).weight(3).gender("여").build(),
				Animal.builder().name("도순이").age(1).weight(18).gender("여").build());
		request.setAttribute("animals",animals);
		
		Map<String,Animal> mapAnimal = Map.of(
					"a",animals.get(0),
					"b",animals.get(1),
					"c",animals.get(2));
				
		request.setAttribute("mapAnimal",mapAnimal);
	%>
	
	<h4><%=((Animal)request.getAttribute("animal")).getName() %></h4>
	<h4>${animal }</h4>
	<h4>${animal.name.length() }</h4>
	
	<ul>
		<li>이름: ${animal.name }</li>
		<li>나이: ${animal.age }</li>
		<li>몸무게: ${animal.weight }</li>
		<li>성별: ${animal.gender }</li>
	</ul>
	<h3>Collection 으로 저장된 데이터 출력하기</h3>
	<h4>
		${animals.get(0).name }
		${animals.get(1).name }
		${animals.get(2).name }
	</h4>
	<h4>
		${mapAnimal.a.name }
		${mapAnimal.b.name }
		${mapAnimal.c.name }
	</h4>
	<h3>메소드 호출하기</h3>
	<p>
		객체의 메소드를 호출하는 것도 가능함
	</p>
	<h4>${animals.isEmpty() }</h4>
	<h4>${animals.size() }</h4>
	<h4>${animals.contains(mapAnimal.a) }</h4>
	
	<h3>연산처리하기</h3>
	<p>
		산술, 논리, 비교, 삼항연산 처리가 가능함
	</p>
	<%
		request.setAttribute("su", 19);
		request.setAttribute("su1", 19);
		request.setAttribute("su2", 19);
		request.setAttribute("su3",1);
		request.setAttribute("testData", "10");
	%>
	<h3>산술연산처리</h3>
	<h4>${su + su2 }</h4>
	<h4>${su - su2 }</h4>
	<h4>${su * su2 }</h4>
	<h4>${su / su2 }</h4>
	<h4>${su * (su2 + 2) / 10 * su3 }</h4>
	<h4>${su*testData }</h4>
	<h3>비교연산</h3>
	<h4>su>su1 ${su>su1 } ${su gt su1 }</h4>
	<h4>su&lt;su1 ${su<su1 } ${su lt su1 }</h4>
	<h4>su>=su1 ${su>=su1 } ${su ge su1 }</h4>
	<h4>su2<=su1 ${su2<=su1 } ${su2 le su1 }</h4>
	<h4>${su>20 }</h4>
	
	<h3>논리연산</h3>
	<p>and, or</p>
	<h4>${su>15 && su2<20 } ${su>15 and su2>20 }</h4>
	<h4>${10<su && su<20 }</h4>
	
	<h3>동등비교하기</h3>
	<h4>== : ${su1==su2 } ${su==su2 }</h4>
	<h4>문자열도 가능 ${testData == "admin" }</h4>
	<h4>eq : ${su1 eq su2 } ${testData eq "admin" }</h4>
	<h4>!= : ${su != su1 } ${testData != "user" }</h4>
	<h4>ne : ${su ne su1 } ${testData ne "users" }</h4>
	
	<h3>null값</h3>
	<h4>${test }</h4>
	
	<h3>삼항연산자 사용하기</h3>
	<h4>${testData eq "admin" ? "관리자" : "일반사용자" }</h4>
	
	<h3>서블릿과 연동해서 EL 이용하기</h3>
	<h4>
		<a href="${pageContext.request.contextPath }/dataTest.do?title=점심먹자">
			 데이터 EL 로 출력하기
		</a>
	</h4>
	<form action="${pageContext.request.contextPath }/dataTest.do" method="POST">
		<input type="text" name="userId">
		<input type="password" name ="password">
		<input type="checkbox" name = "hobby" value="운동">운동
		<input type="checkbox" name = "hobby" value="코딩">코딩
		<input type="checkbox" name = "hobby" value="독서">독서
		<input type="checkbox" name = "hobby" value="영화">영화
		<input type="submit" value="전송">
	</form>
	
	<h3>추가적인 정보 확인하기</h3>
	<p>
		context -> contextPath, requestURI, requestURL -> pageContext.request
		cookie 정보 -> cookie	.
		header 정보 -> header	.
	</p>
	<h4>contextroot : ${pageContext.request.contextPath }</h4>
	<h4>요청 URI : ${pageContext.request.requestURI }</h4>
	<h4>요청 URL : ${pageContext.request.requestURL }</h4>
	<h4>cookie: ${cookie }</h4>
	<h4>cookie: ${cookie.JSESSIONID.name }</h4>
	<h4>cookie: ${cookie.JSESSIONID.value }</h4>
	<h4>header: ${header }</h4>
	<h4>header: ${header["user-agent"] }</h4>
	<h4>header: ${header.host }</h4>
	<h4>header: ${header.referer }</h4>
	
	<%-- ${new Date() } --%> 
	<!-- 저 el 표현시 안에 new 는 쓸 수 없다  ! ~  -->
</body>
</html>