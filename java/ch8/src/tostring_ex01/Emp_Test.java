package tostring_ex01;

public class Emp_Test {

	public static void main(String[] args) {
		Employee emp1 = new Employee("������", "ȸ���", "����", 3000000);
		Employee emp2 = new Employee("�̼���", "������", "����", 3000000);

		System.out.println(emp1.toString());
		System.out.println(emp1);
		System.out.println(emp2.toString());
		System.out.println(emp2);
	}

}
