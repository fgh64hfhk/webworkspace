package com.beans;

import java.io.Serializable;

public class Bike implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected double speed = 0.0;

	public void upSpeed() {
		speed = speed < 1 ? 1 : speed * 1.2;
	}

	public void downSpeed() {
		speed = speed < 1 ? 0 : speed * 0.7;
	}

	public void start() {
		for (int i = 0; i < 100; i++) {
			double r = Math.random() * 2;
			if (r > 1) {
				upSpeed();
			} else {
				downSpeed();
			}
			getSpeed();
		}
	}

	public double getSpeed() {
		System.out.println(this.speed < 1 ? 0 : this.speed);
		return speed;
	}

	@Override
	public String toString() {
		return String.format("Speed is %f km/h", speed);
	}

}
