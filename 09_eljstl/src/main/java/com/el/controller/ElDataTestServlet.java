package com.el.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.el.model.dto.Animal;

/**
 * Servlet implementation class ElDataTestServlet
 */
@WebServlet("/dataTest.do")
public class ElDataTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElDataTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		request.setAttribute("data","requestData");
		request.getSession().setAttribute("data","sessionData");
		getServletContext().setAttribute("data","applicationData");
		
		request.getRequestDispatcher("/views/el/dataTest.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
