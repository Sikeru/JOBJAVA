package ex1;

public class NumberTest {

	public static void main(String[] args) {
		System.out.println("numCount�� �� : " + Number.numCounter);

		Number number1 = new Number();
		number1.increaseNum();
		System.out.println("numCount�� �� : " + Number.getNumCounter());

		Number number2 = new Number();
		number2.increaseNum();
		number2.increaseNum();

		System.out.println("numCount�� �� : " + Number.getNumCounter());
		System.out.println("numCount�� �� : " + number1.getNumCounter());
		System.out.println("numCount�� �� : " + number2.getNumCounter());
	}

}
