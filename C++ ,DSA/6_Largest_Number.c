#include<stdio.h>
int main(){
    int num1=120, num2=67, num3=30;
    if(num1>num2 && num1>num3){
        printf("num1 is Largest");
    }else if(num2>num3){
        printf("num2 is Largest");
    }else{
        printf("num3 is Largest");
    }
    return 1;
}