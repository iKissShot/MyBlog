package top.kissshot.myblog.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebImgConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		String resourceLocations = "file:////D:/_Study/Java/FrameTest/MyBlog/target/classes/top/kissshot/myblog/controller/utils/uploaded/";
		registry.addResourceHandler("/image/**").addResourceLocations(resourceLocations);
	}
}