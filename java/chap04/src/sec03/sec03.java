package sec03;

class Phone {
	String model;
	int value;

	void print() {
		System.out.println(value + "�� ��¥��" + model + "����Ʈ��");
	}
}

public class sec03 {

	public static void main(String[] args) {
		Phone myPhone = new Phone();
		myPhone.model = "������ S8";
		myPhone.value = 100;
		myPhone.print();

		Phone yourPhone = new Phone();
		yourPhone.model = "G6";
		yourPhone.value = 85;
		yourPhone.print();

	}

}
