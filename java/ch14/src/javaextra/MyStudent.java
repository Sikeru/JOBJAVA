package javaextra;

public class MyStudent {
	private String name;
	private int grade;

	public MyStudent() {
		this("�̼���", 2);
	}

	public MyStudent(String name) {
		super();
		this.name = name;
	}

	public MyStudent(String name, int grade) {
		super();
		this.name = name;
		this.grade = grade;
	}

	public String toSting() {
		return "�л� �̸���" + name + ", �г���" + grade + "�г��Դϴ�.";
	}
}
