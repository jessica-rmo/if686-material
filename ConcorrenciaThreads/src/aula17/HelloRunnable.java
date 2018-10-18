package aula17;

public class HelloRunnable implements Runnable {
	public void run() {
		//o que faz a thread
		System.out.println("Hello from thread!");
	}

	public static void main(String[] args) {
		//instancia a thread passando a classe como parâmetro
		(new Thread(new HelloRunnable())).start();
	}
}