package top.kissshot.myblog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@ServletComponentScan
//@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class })
public class Application extends SpringBootServletInitializer {

	// 打包成war包要用，不然会无法响应
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return super.configure(builder);
	}

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

//	String createTB = "CREATE TABLE user(
//			uid int PRIMARY KEY AUTO_INCREMENT, 
//			role int DEFAULT 0, 
//			name varchar(31) NOT NULL, 
//			pwd varchar(31) NOT NULL,
//			email varchar(31) NOT NULL,
//			age int DEFAULT 16,
//			gender char(1) DEFAULT 'F', 
//			motto varchar(255) DEFAULT '我将永不臣服于这失控的世界，自由地追逐繁星！')";

}