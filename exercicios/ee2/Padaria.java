
public class Padaria {
	/**
	 * O forno de uma padaria tem capacidade para assar 50 pães simultaneamente. 
	 * À medida que pães ficam prontos, são retirados do forno. O abastecimento, 
	 * que acontece apenas após o forno ser completamente esvaziado, é feito de maneira que 10 pães 
	 * são colocados no forno por vez, até a capacidade do forno. 
	 * 
	 * Assuma que o primeiro lote de pães colocados no forno é também o primeiro a ser retirado. 
	 * Utilizando uma fila bloqueante, implemente, em Java, o comportamento dessa padaria. 
	 * Considere que retirar os pães do forno é um processo mais lento que o abastecimento dele, 
	 * devido ao tempo necessário para assar os pães.
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
