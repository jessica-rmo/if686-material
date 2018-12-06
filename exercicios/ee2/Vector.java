public class Vector {
	private final int[] content;

	public Vector(int size) {
		this.content = new int[size];
	}

	public int get(int index) {
		synchronized (this.content) {
			return this.content[index];
		}
	}

	public void set(int index, int value) {
		synchronized (this.content) {
			this.content[index] = value;
		}
	}

	public void swap(int a, int b) {
		synchronized (this.content) {
			int i = this.content[a];
			this.content[a] = this.content[b];
			this.content[b] = i;
		}
	}
}