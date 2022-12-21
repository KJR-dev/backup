public class INVERTED_ROTATED_HALF_PYRAMID {
    public static void main(String []args){
        int n=4;
        for (int i = n; i > 0; i--) {
            for (int j = 0; j < n; j++) {
                if(j>=i-1){
                    System.out.print("*");
                }else{
                    System.out.print(" ");
                }
            }
            System.out.println();
        }
    }
}
