package top.kissshot.myblog.test;

import java.io.IOException;
import java.util.logging.ConsoleHandler;
import java.util.logging.FileHandler;
import java.util.logging.Formatter;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;

import org.junit.Test;

public class TestLogger {
	@Test
	public void log4j() {
		Logger logger = Logger.getLogger("LoggerLog");
		logger.setLevel(Level.ALL);

		ConsoleHandler handler = new ConsoleHandler();
		handler.setLevel(Level.ALL);
		logger.addHandler(handler);
		try {
			FileHandler fileHandler = new FileHandler("D:\\_Study\\Java\\FrameTest\\MyBlog\\err.txt", false);
			fileHandler.setLevel(Level.ALL);
			fileHandler.setFormatter(new Formatter() {
				@Override
				public String format(LogRecord record) {
					return record.getLevel() + ": \t" + record.getMillis() + ": \t" + record.getMessage() + "\n";
				}
			});
			logger.addHandler(fileHandler);
		} catch (SecurityException | IOException e) {
			e.printStackTrace();
		}

		logger.info("Start");
		logger.info("Running");
		logger.warning("End");
	}
}