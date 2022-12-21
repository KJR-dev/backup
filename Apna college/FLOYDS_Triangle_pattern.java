public class FLOYDS_Triangle_pattern {
    public static void main(String []args){
        int outter=5;
        int inner=5;
        int num=1;
        for (int i = 0; i < outter; i++) {
            for (int j = 0; j <= i; j++) {
                System.out.print(num++ +" ");
            }
            System.out.println();
        }
    }
}
