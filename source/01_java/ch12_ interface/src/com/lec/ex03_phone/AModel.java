package com.lec.ex03_phone;
//접근     클래스    클래스이름  implements (상속interface(이름)
public class AModel implements IAcorporation {
	private String modelName;

	public AModel() {
		modelName = "A모델";
	}

	@Override
	public void dmbReceive() {
		System.out.println(modelName + "은 DMB 송신 가능");

	}

	@Override
	public void lte() {
		System.out.println(modelName + "5G");

	}

	@Override
	public void tvRemotecont() {
		System.out.println(modelName + "은 TV리모콘 탑재");

	}

}
