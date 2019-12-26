package top.kissshot.myblog.controller.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.json.JSONString;
import org.json.JSONStringer;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TranslatorAjaxController {
	@PostMapping("/Utils/Translator/translate")
	public String translate(@RequestBody String url) {
		url = URLDecoder.decode(url);
		System.err.println(url);
		StringBuffer buffer = new StringBuffer();
		try {
			HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
			con.setRequestMethod("GET");
			con.connect();
			BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String str = null;
			while ((str = reader.readLine()) != null)
				buffer.append(str);
			reader.close();
			con.disconnect();
			System.err.println(buffer);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return buffer.toString();
	}
}