package ex17;

public class Elementary extends Student {

	public Elementary(String name, int grade) {
		System.out.println("Elementary ������ ȣ��");
		this.name = name;
		this.grade = grade;
	}

	public Elementary(String name, int grade, String gender, int age) {
		System.out.println("���� 4���� Elemntary ������ ȣ��");
		this.name = name;
		this.grade = grade;
		super.gender = gender;
		super.age = age;
	}
}
