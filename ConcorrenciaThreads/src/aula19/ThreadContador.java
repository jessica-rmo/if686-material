package aula19;

public class ThreadContador extends Thread {
	private int cont;
	private int val_limite;

	public ThreadContador(int lim) {
		this.val_limite = lim;
		this.cont = 0;
	}

	public void run() {
		for (int i = 0; i < this.val_limite; i++) {
			System.out.println(this.cont);
			this.cont++;
		}
	}

	public static void main(String[] args) {
		int N = 5;      //numero de threads
		int lim = 10;   //valor de parada

		for (int i = 0; i<N; i++) {
			(new ThreadContador(lim)).start();
		}
	}

}
