package lnner_ex1;

public class InnerTest1 {

	public static void main(String[] args) {
		MyOuter1 myOuter = new MyOuter1("ȫ�浿", 20);
		MyOuter1.Inner inner = myOuter.new Inner("������ ������");
		System.out.println("������ >>" + inner.getUserInfo());
	}
}
