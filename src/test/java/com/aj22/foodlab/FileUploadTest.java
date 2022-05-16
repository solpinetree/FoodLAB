package com.aj22.foodlab;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockServletContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FileUploadTest {

	private MockServletContext context = new MockServletContext();
	
	@Test
	public void fileuploadTest() {
		System.out.println(context.getRealPath("/upload"));
	}
	
}
