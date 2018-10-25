package aula20;

public class No {
	private int valor;
	private No next, prev;
	
	public No() {
		this.valor = 0;
		this.next = this.prev = null;
	}
	
	public No(int v) {
		this.valor = v;
		this.next = this.prev = null;
	}
}
