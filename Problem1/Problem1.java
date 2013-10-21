/* If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000. */

public class Problem1{
	private int result;
	
	public Problem1(){
		this.result = new Integer(0);
		this.resolve();
	}
	
	public void resolve(){
		Integer i = 0;
		Integer res = 0;
		for(i=0;i<1000;i++){
			if(i%3==0 || i%5==0){
				this.result += i;
			}
		}
	}
	
	public static void main(String[] args){
		Problem1 problem = new Problem1();
		System.out.println(problem.result);
	}
}