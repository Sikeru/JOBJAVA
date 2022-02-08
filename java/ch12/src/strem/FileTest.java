package strem;

import java.io.File;

public class FileTest {

	public static void main(String[] args) {
		File file = new File(".", "FileTest.java");

		System.out.println("������ ��δ�?" + file.getPath());
		System.out.println("������ �̸���?" + file.getName());
		System.out.println("������ �������͸���?" + file.getParent());
		System.out.println("������ �����δ�?" + file.getAbsolutePath());
		System.out.println("������ �����γ�?" + file.isAbsolute());
		System.out.println("�����̳�?" + file.isFile());
		System.out.println("������ �����ϴ���?" + file.exists());
		System.out.println("���͸��̳�?" + file.isDirectory());
		System.out.println("������ ���� �� �ֳ�?" + file.canRead());
		System.out.println("������ �� �� �ֳ�?" + file.canWrite());
		System.out.println("������ ����Ʈ ũ���?" + file.length());
		boolean b = new File("." + File.separator + "hello").mkdir();

		String[] listing = new File(".").list();
		System.out.println("���� ���͸� ������?");
		for (int i = 0; i < listing.length; ++i) {
			System.out.println(listing[i]);
		}

	}

}
