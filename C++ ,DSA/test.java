//n=5
//0 1=1
//1 1=2


import java.util.Scanner;

class test{
    public static void main(String args[]){
        Scanner sc = new Scanner(System.in);
        int n=sc.nextInt();
        int r=fib(n);
        int result=1;
        int fib(int n){
            
        }
    }

    private static int fib(int n) {
        if(n==0){
            break;
        }
        result=result*fib(n--);
    }
}