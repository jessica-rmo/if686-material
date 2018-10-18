package aula17;

public class ExercicioDoisBi extends Thread{
	
	public ExercicioDoisBi(int ini, int end) {
		this.run(ini,end);
	}
	
	public void run(int ini, int end) {
		this.printRange(ini,end);
	}

	public void printRange(int ini, int end) {
		for (int i = ini; i < end; i++) {
			System.out.println(i);
		}
	}

	public static void main(String[] args) {
		/** instanciando cada thread numa linha **/
//		(new ExercicioDoisBi(1,500000)).start();
//		(new ExercicioDoisBi(500001,1000000)).start();
//		(new ExercicioDoisBi(1000001,1500000)).start();
//		(new ExercicioDoisBi(1500001,2000001)).start();
		
		/** instanciando um array de threads **/
		Thread threads[] = new ExercicioDoisBi[50]; //criando array com 50 threads
		int ini = 1;
		int end = 50001;

		for (int i = 0; i < threads.length; i++) {
			threads[i] = new ExercicioDoisBi(ini,end);
			(threads[i]).start();
			if (end < 2000000) {
				ini += 50000;
				end += 50000;
			}
		}
	}
	
}
