public class BUTTERFLY_pattern {
    public static void main(String[] args) {
        int n = 5;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (((j > i) && (j < (n-1-i))) || ((i>n/2) && (j>=(n-i) &&(j<i)))){
                    System.out.print(" ");
                } else {
                    System.out.print("*");
                }
            }
            System.out.println();
        }
    }
}
