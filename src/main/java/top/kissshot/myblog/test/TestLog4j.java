package top.kissshot.myblog.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
public class TestLog4j {

	@Test
	public void log() {
		Logger logger = LoggerFactory.getLogger(TestLog4J_.class);
		logger.trace("调试信息");
		logger.debug("杀虫信息");
		logger.info("普通信息");
		logger.warn("警告信息");
		logger.error("错误信息");

		for (int i = 1; i <= 9; i++) {
			for (int j = 1; j <= i; j++)
				System.err.print(j + " * " + i + " = " + (i * j) + "\t");
			System.err.println();
		}
	}
}