package aula18;

public class NPrimos extends Thread {

	public NPrimos(int ini, int end) {
		this.run(ini,end);
	}

	public void run(int ini, int end) {
		int[] primos = this.calculaPrimos(ini, end);
		System.out.println("Primos de "+ini+" ate "+end+":");
		print(primos);
		System.out.println();//
	}

	private int[] calculaPrimos(int ini, int end) {
		int primos[] = new int[end-ini];
		int position = 0;

		for (int i = ini; i < end; i++) {
			if (this.ehPrimo(i)) {
				primos[position] = i;
				position++;
			}
		}
		return this.trimArray(primos);
	}

	public int[] trimArray(int[] a) {
		//metodo fuleiro pra gerar um array sem posições vazias
		int len = 0;

		for (int i = 0; i<a.length; i++) {
			if (a[i] != 0) { len++; }
		}

		int b[] = new int[len];
		for (int i = 0; i<len; i++) {
			b[i] = a[i];
		}

		return b;
	}

	//imprimir um número abaixo do outro
	public void println(int[] a) {
		for (int i = 0; i<a.length; i++) {
			System.out.println(a[i]);
		}
	}

	public void print(int[] a) {
		for (int i = 0; i<a.length; i++) {
			System.out.print(a[i] + " ");
		}
		System.out.println();//
	}


	public boolean ehPrimo(int n) {
		boolean ehPrimo = true;
		if (n < 2) ehPrimo = false;

		for (int i = 2; i*i <= n; i++) {
			if (n%i == 0) {
				ehPrimo = false;
				break;
			}
		}
		return ehPrimo;
	}

	public static void main(String[] args) {		
		int N = 500;	//primos ate N
		int X = 10;		//numero de threads usadas

		int faixa = (N/X);
		int end = faixa;

		for (int i = 0; i < X; i++) {
			Thread t = new NPrimos(i*faixa+1, end); //(ini,end)
			t.start();
			end += faixa;
			
			try {
				t.join();
			} catch(InterruptedException ie) {}
		}
	}
}
