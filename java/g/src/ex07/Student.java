package ex07;

import ex08.Person;

public class Student extends Person {
	protected String name;
	protected int grade;
//	String name;
//	int grade;

	public Student() {
		System.out.println("student �θ� ������ ȣ��");
	}

	public String getName() {
		return name;
	}

	public int getGrade() {
		return grade;
	}

	public String getStudInfo() {
		System.out.println("Student Ŭ������ getStudInfo() ȣ��");
		return "�̸�: " + name + "�г�: " + grade;
	}
}
