public class HOLLOW_RECTANGLE_pattern {
    public static void main(String[] args){
        int outter=5;
        int inner=5;
        for (int i = 0; i < outter; i++) {
            for (int j = 0; j < inner; j++) {
                if(i==0 || j==0 || j== (inner-1) || i==(outter-1)){
                    System.out.print("*");
                }else{
                    System.out.print(" ");
                }
            }
            System.out.println();
        }
    }
}
