package stringmethod_ex02;

public class StringTest2 {

	public static void main(String[] args) {
		String fruitData = "��� �ٳ��� �� ����";
		String deptData = "�λ��, ȸ���, ���ߺ�, ������";
		String prodData = "����ƮTV-����Ʈ��-��Ʈ��-�º�";
		String[] data = null;

		data = fruitData.split(" ");

		for (int i = 0; i < data.length; i++) {
			System.out.println(data[i]);
		}

		data = deptData.split(",");

		for (int i = 0; i < data.length; i++) {
			System.out.println(data[i]);
		}

		data = prodData.split("-");

		for (int i = 0; i < data.length; i++) {
			System.out.println(data[i]);
		}
	}

}
