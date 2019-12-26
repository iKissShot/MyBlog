package top.kissshot.myblog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		String path = request.getServletPath();
//		if (path.matches(Const.NO_INTERCEPTOR_PATH)) {
//			 不需要的拦截直接过
//			return super.preHandle(request, response, handler);
//		} else {
		// 这写你拦截需要干的事儿，比如取缓存，SESSION，权限判断等

		System.out.println("====================================");
		if (request.getSession().getAttribute("uid") == null) {
			System.err.println("没登录");

			String backUrl = request.getRequestURI();
			if (request.getQueryString() != null)
				backUrl += "?" + request.getQueryString();
//			request.getSession().setAttribute("backUrl", backUrl);
			System.err.println(backUrl);

			response.sendRedirect("/dev/userLogin");
			return super.preHandle(request, response, handler);
		} else {
			System.err.println(
					request.getSession().getAttribute("uid") + ":" + request.getSession().getAttribute("name"));
			return super.preHandle(request, response, handler);
		}
//		}
	}
}