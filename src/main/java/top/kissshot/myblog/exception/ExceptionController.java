package top.kissshot.myblog.exception;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExceptionController {

	@RequestMapping("/Exception")
	public String test() throws Exception {

		if (true) {
			throw new Exception("some exception");
		}

		return "Test ExceptionHandler";
	}
}