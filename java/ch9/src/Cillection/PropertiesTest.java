package Cillection;

import java.util.Enumeration;
import java.util.Properties;

public class PropertiesTest {

	public static void main(String[] args) {
		Properties p = new Properties();

		p.setProperty("name", "ȫ�浿");
		p.setProperty("age", "18");
		p.setProperty("job", "���α׷���");

		String name = p.getProperty("name");
		System.out.println("name : " + name);
		System.out.println("===================");
		Enumeration e = p.propertyNames();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			System.out.println(key + "=" + p.getProperty(key));
		}
	}

}
