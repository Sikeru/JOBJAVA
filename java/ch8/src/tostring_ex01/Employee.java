package tostring_ex01;

public class Employee {
	String name;
	String dept;
	String job;
	int salary;

	public Employee(String name, String dept, String job, int salary) {
		super();
		this.name = name;
		this.dept = dept;
		this.job = job;
		this.salary = salary;
	}

	public String toString() {
		String data = "����� �̸� : " + name + ", " + "����� �μ� : " + dept + ", " + "����� ���� : " + job + ", " + "�޿� : "
				+ salary + "��";
		return data;
	}
}
