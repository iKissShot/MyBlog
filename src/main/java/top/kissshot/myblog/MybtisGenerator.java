package top.kissshot.myblog;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MybtisGenerator {
	public static void main(String[] args) throws Exception {
//		String today = "2019-12-02"; //生成myblog基础表
//		String today = "2019-12-07"; //生成导航基础表
//		String today = "2019-12-10"; //实现一人一导航
		String today = "2019-12-12"; //颜色拾取器
		boolean forceGenerate = false;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = sdf.parse(today);
		Date d = new Date();

		if (d.getTime() > now.getTime() + 1000 * 60 * 60 * 24) {
			System.err.println("——————未成成功运行——————");
			System.err.println("——————未成成功运行——————");
			System.err.println("本程序具有破坏作用，应该只运行一次，如果必须要再运行，需要修改today变量为今天，如:" + sdf.format(new Date()));
			return;
		}

		if (!forceGenerate) {
			System.err.println("——————请确认强制生成，会覆盖现有修改——————");
			return;
		}

		System.err.println("——————开始生成中，请耐心等待——————");
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
		InputStream is = MybtisGenerator.class.getClassLoader().getResource("generatorConfig.xml").openStream();
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(is);
		is.close();
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		myBatisGenerator.generate(null);

		System.err.println("生成代码成功，只能执行一次，以后执行会覆盖掉mapper,pojo,xml 等文件上做的修改");

	}
}