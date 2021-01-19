package com.devpro.shop;

import com.github.slugify.Slugify;

public class Utilities {
	public static void main(String[] args) {
		Slugify slg = new Slugify();
		String result = slg.slugify("Queen Chair M&Veins" + "-" + System.currentTimeMillis());
		System.out.println(result);
	}
}
