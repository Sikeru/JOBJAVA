package stringbuffer_ex01;

public class StringBufferTest {

	public static void main(String[] args) {
		StringBuffer city1 = new StringBuffer("���ѽ�");
		StringBuffer city2 = city1.append(" �α���");
		System.out.println("city1 : " + city1);
		System.out.println("city2 : " + city2);

		city2.append(" �ϳ���");
		System.out.println("city1 : " + city1);
		System.out.println("city2 : " + city2);
	}

}
