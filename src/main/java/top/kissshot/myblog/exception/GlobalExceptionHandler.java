package top.kissshot.myblog.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(Exception.class)
	public ModelAndView defaultErrorHander(HttpServletRequest req, Exception e) {
		ModelAndView mav = new ModelAndView("errorPage");
		mav.addObject("exception", e);
		mav.addObject("url", req.getRequestURL());
		return mav;
	}
}