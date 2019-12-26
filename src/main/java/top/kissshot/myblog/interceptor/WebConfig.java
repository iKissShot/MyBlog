package top.kissshot.myblog.interceptor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

//	@Autowired
//	LoginInterceptor loginInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 拦截所有请求，通过判断是否有 @LoginRequired 注解 决定是否需要登录
		InterceptorRegistration ir = registry.addInterceptor(LoginInterceptor());
		ir.addPathPatterns("/**");
		ir.excludePathPatterns(
				"/", 
				"/dev/index", 
				"/dev/header",
				"/dev/footer",
				"/dev/timeLine",
				"/dev/about",
				"/dev/tools",
				"/Utils/**", 
				"/dev/userOut",
				"/dev/userRegist", 
				"/dev/userRegistConfirm", 
				"/dev/userLogin", 
				"/dev/userLoginBack",
				"/dev/userLoginConfirm", 
				"/static/**", 
				"/dev/static/**");
	}

	@Bean
	public LoginInterceptor LoginInterceptor() {
		return new LoginInterceptor();
	}
}