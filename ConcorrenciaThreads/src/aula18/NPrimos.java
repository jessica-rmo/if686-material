package aula18;

public class NPrimos extends Thread {
	
	public NPrimos(int n) {
		this.run(n);
	}
	
	public void run(int n) {
		int[] primos = this.calculaPrimos(n);
		print(primos);
	}

	private int[] calculaPrimos(int n) {
		int primos[] = new int[n];
		int position = 0;
		
		for (int i = 1; i < n; i++) {
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
	
	public void print(int[] a) {
		for (int i = 0; i<a.length; i++) {
			System.out.println(a[i]);
		}
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
		(new NPrimos(50)).start();
		
		//fazer com N threads
	}
}
