package ex01;

public class Student {
	private String name;
	private int grade;
	private String address;

	public Student(String _name, int _grade, String _address) {
		System.out.println("���ڰ� 3���� ������ ȣ��");
		name = _name;
		grade = _grade;
		address = _address;
	}

	public Student(String _name, int _grade) {
		System.out.println("���ڰ� 2���� ������ ȣ��");
		name = _name;
		grade = _grade;
	}

	public Student(String _name) {
		System.out.println("���ڰ� 1���� ������ ȣ��");
		name = _name;
	}

	public Student() {
		System.out.println("����Ʈ ������ ȣ��");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
