
public class Forno {
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

	public static void main(String[] args) {
		BQueue padaria = new BQueue(50);
		Vector forno = new Vector(50);
		
		padaria.fila = forno.content;
		
			
		

	}

}
