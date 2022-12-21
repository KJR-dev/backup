public class SOLID_RHOMBUS_pattern {
    public static void main (String []args){
        int n=4;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n * 2; j++) {
                if (j>=n-i && j<n*2-i) {
                    System.out.print("*");
                }else {
                    System.out.print(" ");
                }
            }
            System.out.println();
        }
    }
}
