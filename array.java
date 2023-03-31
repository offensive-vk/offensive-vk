//Java Program to Demonstrate Array Indexes.
class array{
	public static void main(String[] args) {
	int[] arr = new int[5];
	arr[0] = 10;
	arr[1] = 20;
	arr[2] = 30;
	arr[3] = 40;
	arr[4] = 50;

	System.out.println("Array Length is "+arr.length);
	System.out.println("\nArray 1st Value "+arr[0]);
	System.out.println("\nArray 2nd Value "+arr[1]);
	System.out.println("\nArray 3rd Value "+arr[2]);
	System.out.println("\nArray 4th Value "+arr[3]);
	System.out.println("\nArray 5th Value "+arr[4]);
	for(int i = 0; i<arr.length; i++){
		System.out.println(arr[i]);
		System.out.println("\n");
	}
	}
}
