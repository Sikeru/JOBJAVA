package ex14;

public class Elementary extends Student {

	public Elementary(String _name, int _grade) {
		System.out.println("Elementary ������ ȣ��");
		name = _name;
		grade = _grade;
	}

	public Elementary(String _name, int _grade, String _gender, int _age, String gender, int age) {
		System.out.println("���� 4���� Elemntary ������ ȣ��");
		name = _name;
		grade = _grade;
		gender = _gender;
		age = _age;
	}
}
