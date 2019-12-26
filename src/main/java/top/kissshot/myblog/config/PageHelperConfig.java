package top.kissshot.myblog.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.github.pagehelper.PageHelper;

@Configuration
public class PageHelperConfig {

	@Bean
	public PageHelper helper() {
		PageHelper helper = new PageHelper();
		Properties p = new Properties();
		p.setProperty("offsetAsPageNum", "true");
		p.setProperty("rowBoundWithCount", "treu");
		p.setProperty("reasonable", "true");
		return helper;
	}
}