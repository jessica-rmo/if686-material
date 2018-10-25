package aula20;

import java.util.ArrayList;

public class Fila {
	public ArrayList<No> fila;

	public Fila() {
		this.fila = new ArrayList<No>();
	}

	public void add(No elem) {
		//add no fim da fila
		this.fila.add(elem);
	}

	public void del() {
		//remove do inicio da fila
		this.fila.remove(0);
	}

}
