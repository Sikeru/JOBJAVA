package lnner_ex1;

public class MyOuter2 {
	private String name;
	private int age;

	public MyOuter2(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	public void test() {
		int num = 23;
		class Inner {
			private String address;

			public Inner(String address) {
				this.address = address;
			}

			public String getUserInfo() {
				return "�̸� : " + name + ", ���� : " + age + ", �ּ� : " + address;
			}
		}
		Inner inner = new Inner("������");
		System.out.println(inner.getUserInfo());

	}

}
