public class Zero_One_Triangle_pattern {
    public static void main(String[] args) {
        int num=5;
        for (int i = 1; i <= num; i++) {
            int temp=i%2;
            for (int j = 1; j <= i; j++) {
                if(temp==1) {
                    System.out.print(temp--);
                }else{
                    System.out.print(temp++);
                }
            }
            System.out.println();
        }
    }
}