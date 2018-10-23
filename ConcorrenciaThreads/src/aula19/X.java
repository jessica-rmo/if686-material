package aula19;

public class X extends Thread {
	private NContador count;
	
	public X(NContador c) {
		this.count = c;
	}
}
