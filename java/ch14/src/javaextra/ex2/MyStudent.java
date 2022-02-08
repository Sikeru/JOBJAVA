package javaextra.ex2;

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

	public void calcScore(int... sco) {
		double avg;
		int tol = 0;

		for (int i : sco) {
			tol += i;
		}
		avg = tol / 3.0;

		System.out.println("���������� ������ : " + tol);
		System.out.println("���������� ����� : " + avg);
	}
}
