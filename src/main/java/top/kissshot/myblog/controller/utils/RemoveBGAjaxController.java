package top.kissshot.myblog.controller.utils;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class RemoveBGAjaxController {

	@PostMapping("/Utils/RemoveBG/Upload")
	public String upload(HttpServletRequest req, @RequestParam(value = "file") MultipartFile muFile,
			@RequestParam(value = "name") String name) {
		String fileName_ = name + "_" + System.currentTimeMillis();
		String fileName = name + ".jpg";
		String shuffix = this.getClass().getResource("").getPath();
		String imgFolder = shuffix + "uploaded/";
		File file = new File(imgFolder, fileName);
		file.getParentFile().mkdir();

		try {
			FileOutputStream fos = FileUtils.openOutputStream(file);
			IOUtils.copy(muFile.getInputStream(), fos);
			fos.close();

			rmBG(shuffix, imgFolder, file.getName());
			
			System.err.println(fileName + "\n" + fileName_);
			String s = "/image/" + fileName + "_no_bg.png";
			return s;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void rmBG(String shuffix, String imgFolder, String fileName) {
//		#arg0	py路径
//		#arg1	密匙
//		#arg2	log路径
//		#arg3 	类型
//		#arg4	imgPoU imgPath or imgUrl

		try {
//			py命令行示例			
//			D:/_Study/Java/FrameTest/MyBlog/target/classes/top/kissshot/myblog/controller/utils/removeBG.py MaFifvuVf7FwTYJiqqvwzHWZ D:/_Study/Java/FrameTest/MyBlog/target/classes/top/kissshot/myblog/controller/utils/error.log file D:/_Study/Java/FrameTest/MyBlog/target/classes/top/kissshot/myblog/controller/utils/uploaded/ABC_1576684613940.jpg
			String exe = "python";
			String pyPath = (shuffix + "removeBG.py").substring(1);
			String key = "MaFifvuVf7FwTYJiqqvwzHWZ";
			String logPath = (shuffix + "error.log").substring(1);
			String type = "file";
			String imgPaU = (imgFolder + fileName).substring(1);
			String[] cmdArr = new String[] { exe, pyPath, key, logPath, type, imgPaU };
			for (String s : cmdArr)
				System.err.println(s);

			Process process = Runtime.getRuntime().exec(cmdArr);
			DataInputStream stream = new DataInputStream(process.getInputStream());
			String str = new DataInputStream(process.getInputStream()).readLine();
//			process.waitFor();
			System.err.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}