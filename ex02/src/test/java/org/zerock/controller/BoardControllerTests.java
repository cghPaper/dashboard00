package org.zerock.controller;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Tomcat(WAS) 를 실행하지 않고 Controller 를 테스트할 수 있는 방법
 * @author CGH
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
// Test for Controller
@WebAppConfiguration // Servlet 의 ServletContext 를 이용하기 위해서인데, 스프링에서는 WebApplicationContext 라는 존재를 이용하기 위해서 이다.
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	, "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
// Java Config
// @ContextConfiguration(classes={
//   org.zerock.config.RootConfig.class
//   , org.zerock.config.ServletConfig.class
// })
@Log4j
public class BoardControllerTests {
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	// MockMvc 는 가짜로 URL과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어서 Controller를 실행해 볼 수 있다.
	private MockMvc mockMvc;
	
	@Before // import 할 때 JUnit 을 이용해야 함, 모든 테스트 전에 매번 실행되는 메서드
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info(mockMvc.perform(
					    MockMvcRequestBuilders.get("/board/list"))
				        .andReturn()
				        .getModelAndView()
				        .getModelMap()
				);
	}
	
	
	@Test 
	public void testRegister() throws Exception { 
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
				.post("/board/register")
					.param("title", "테스트 새글 제목")
					.param("content", "테스트 새글 내용")
					.param("writer","user00"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	 
	
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(
//				        MockMvcRequestBuilders.get("/board/get").param("bno", "2"))
//				        .andReturn()
//				        .getModelAndView()
//				        .getModelMap()
//				);
//	}
	
	
	@Test 
	public void testRemove() throws Exception {
		// 삭제전 데이터베이스에 게시물 번호 확인할 것
		String resultPage = mockMvc
			  .perform(MockMvcRequestBuilders.post("/board/remove")
					  .param("bno", "25"))
			  .andReturn().getModelAndView().getViewName(); 
		log.info(resultPage); 
	}
	 
}