package top.kissshot.myblog.test;

import java.io.DataInputStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.python.util.PythonInterpreter;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestJython {
//	@Test
	public void test() {
		try {
			String exe = "python";
			String command = "D:\\_Study\\Java\\FrameTest\\MyBlog\\src\\main\\java\\top\\kissshot\\myblog\\test\\py_calculator_simple.py";
			String arg1 = "1";
			String arg2 = "2";
			String[] cmdArr = new String[] { exe, command, arg1, arg2 };
			Process process = Runtime.getRuntime().exec(cmdArr);
			String str = new DataInputStream(process.getInputStream()).readLine();
			process.waitFor();
			System.err.println(str);

			System.setProperty("python.home", "D:\\_SoftWare\\Python27");
			String python = "D:\\_Study\\Java\\FrameTest\\MyBlog\\src\\main\\java\\top\\kissshot\\myblog\\test\\py_simple_python.py";
			PythonInterpreter interp = new PythonInterpreter();
			interp.execfile(python);
			interp.cleanup();
			interp.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Test
	public void rmBG() {
//		#arg0	py路径
//		#arg1	密匙
//		#arg2	log路径
//		#arg3 	类型
//		#arg4	imgPoU imgPath or imgUrl

		try {
			String shuffix = this.getClass().getResource("").getPath();
			String exe = "python";
			String pyPath = (shuffix + "py_removeBG.py").substring(1).replace("/", "//");
			String key = "MaFifvuVf7FwTYJiqqvwzHWZ";
			String logPath = (shuffix + "error.log").substring(1).replace("/", "//");
			String type = "file";
			String imgPaU = (shuffix + "konachan.jpg").substring(1).replace("/", "//");
			String[] cmdArr = new String[] { exe, pyPath, key, logPath, type, imgPaU };
//			System.err.println(Arrays.toString(cmdArr));

			Process process = Runtime.getRuntime().exec(cmdArr);
			DataInputStream stream = new DataInputStream(process.getInputStream());
			String str = new DataInputStream(process.getInputStream()).readLine();
			process.waitFor();
			System.err.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}