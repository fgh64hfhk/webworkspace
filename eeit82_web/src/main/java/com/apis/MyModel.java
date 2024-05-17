package com.apis;

public class MyModel {

	private int x, y;
	private int result;
	private int remainder;

	public MyModel(String x, String y) {
		try {
			this.x = Integer.parseInt(x);
			this.y = Integer.parseInt(y);

		} catch (NumberFormatException formatException) {
			System.out.println("formatException");
			this.x = 0;
			this.y = 0;
			System.out.println(formatException);
		}
	}

	public void add() {
		this.result = this.x + this.y;
	}

	public void subtract() {
		this.result = this.x - this.y;
	}

	public void multiply() {
		this.result = this.x * this.y;
	}

	public void divide() {
		if (this.y == 0) {
			throw new ArithmeticException("Cannot divide by zero");
		}
		this.result = this.x / this.y;
		this.remainder = this.x % this.y;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public int getResult() {
		return result;
	}

	public int getRemainder() {
		return remainder;
	}

}
