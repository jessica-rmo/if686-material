
public class Padaria {
	/**
	 * O forno de uma padaria tem capacidade para assar 50 p�es simultaneamente. 
	 * � medida que p�es ficam prontos, s�o retirados do forno. O abastecimento, 
	 * que acontece apenas ap�s o forno ser completamente esvaziado, � feito de maneira que 10 p�es 
	 * s�o colocados no forno por vez, at� a capacidade do forno. 
	 * 
	 * Assuma que o primeiro lote de p�es colocados no forno � tamb�m o primeiro a ser retirado. 
	 * Utilizando uma fila bloqueante, implemente, em Java, o comportamento dessa padaria. 
	 * Considere que retirar os p�es do forno � um processo mais lento que o abastecimento dele, 
	 * devido ao tempo necess�rio para assar os p�es.
	 * 
	 * **/
	
	private int[] forno;
	
	public Padaria(int[] forno) {
		this.forno = forno;
	}
		
	public void abastecer() {
		
	}

	public void retirar() {
		
	}
	
	public static void main(String[] args) {
		BQueue forno = new BQueue(50);
		//push(val), pop, getSize

		Padaria padaria = new Padaria(forno.fila);
		

	}

}
