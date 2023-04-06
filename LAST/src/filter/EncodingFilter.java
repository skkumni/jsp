package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements Filter {
	// init : 서버 실행시 한번 실행
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
	
	// destroy : 서버 종료시 한번 실행
	@Override
	public void destroy() {}

	// 페이지 요청마다 실행
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 1. 공통적으로 처리할 코드를 작성하고
		request.setCharacterEncoding("utf-8");
				
		// 2. 원래 요청하려던 페이지로 보내라~
		chain.doFilter(request, response);
	}
}
