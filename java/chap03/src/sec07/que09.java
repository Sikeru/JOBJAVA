package sec07;

public class que09 {

	public static void main(String[] args) {
		foo("�ȳ�", 1);
		foo("�ȳ��ϼ���", 1, 2);
		foo("���־�", 1);
	}

	public static void foo(String str, int i) {
		System.out.println(str + " " + i);
	}

	public static void foo(String str, int i, int j) {
		System.out.println(str + " " + i + " " + j);
	}

	public static void foo(String str) {
		System.out.println(str);
	}
}
