package aula20;

public class Counter {
	private  long  value;

	public  long  getAndIncrement()  {
		long temp;
		
		//trava: garante Exclusao Mutua (uma thread entra de cada vez)
		synchronized(this) {
			temp = value;
			value = temp+1;
		}
		return temp;
	}
}
