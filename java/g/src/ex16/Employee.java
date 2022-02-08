package ex16;

public class Employee {
	protected String name;
	protected String job;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public void getEmpInfo(Employee e) {
		if (e instanceof Account) {
			System.out.println("���� : " + e.getJob());
		} else if (e instanceof Research) {
			Research res = (Research) e;
			System.out.println("��å : " + res.getPosition());
		}
	}
}
