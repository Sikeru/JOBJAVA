package strem;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class StandardTest {

	public static void main(String[] args) {
		String mesg = null;

		InputStreamReader ir = new InputStreamReader(System.in);
		// System.in�� node�� �ش�ȴ�.
		// InputStreamReader�� System.in�� ���ΰ��ִ� ���Ϳ� �ش�ȴ�.
		BufferedReader in = new BufferedReader(ir);
		// BufferedReader�� InputStreamReader�� System.in�� ���ΰ��ִ� ���Ϳ� �ش�ȴ�.
		System.out.println("exit:Ctrl+Z");

		try {
			mesg = in.readLine();
			while (mesg != null) {
				System.out.println("�б� : " + mesg);
				mesg = in.readLine();
			}
			in.close();
			ir.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
