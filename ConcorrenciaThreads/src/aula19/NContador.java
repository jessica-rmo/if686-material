package aula19;

public class NContador {
	int c;
	
	public void getAndIncrement() {
		synchronized(this) {
			c++;
		}
	}

	public static void main(String[] args) {
		NContador c = new NContador();
		
		X x1 = new X(c);
		X x2 = new X(c);
		X x3 = new X(c);
	}
}
