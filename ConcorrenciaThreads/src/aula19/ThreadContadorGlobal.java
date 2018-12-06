package aula19;

public class ThreadContadorGlobal extends Thread {
	private static int cont;
	private int val_limite;

	public ThreadContadorGlobal(int lim) {
		this.val_limite = lim;
	}

	public void run() {
		for (int i = 0; i < this.val_limite; i++) {
			System.out.println(cont);
			cont++;
		}
	}

	public static void main(String[] args) {
		int N = 5;      //numero de threads
		int lim = 10;   //valor de parada

		for (int i = 0; i<N; i++) {
			(new ThreadContadorGlobal(lim)).start();
		}
	}

}
