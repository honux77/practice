public class BinaryPrint {
	public static void main(String[] args) {
		System.out.println(BinaryPrint.printNum("a", 0));
		System.out.println(BinaryPrint.printNum("a", -1));
		System.out.println(BinaryPrint.printNum("a", -2));
		System.out.println(BinaryPrint.printNum("a", 1));
		System.out.println(BinaryPrint.printNum("a", 33));
	}

	public static String printNum(String varName, int num) {
		StringBuffer sb = new StringBuffer();
		sb.append(varName + ": ");
		int numZero = Integer.numberOfLeadingZeros(num);
		for (int i = 0; i < numZero; i++) {
			sb.append("0");
		}

		if (Integer.SIZE != numZero) {
			sb.append(Integer.toBinaryString(num));
		}

		sb.append("\t[" + num +"]");
		return sb.toString();
	}    
}
