package aula17;

public class HelloThread extends Thread {
	public void run() {
		//o que faz a thread
		System.out.println("Hello from Thread!");
	}

	public static void main(String[] args) {
		//instancia e inicia a thread
		(new HelloThread()).start();
	}
}