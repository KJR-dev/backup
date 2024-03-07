#include<stdio.h>
int main(){
    int days=399,year,month,day;
    year=days/365;
    days=days%365;
    month=days/30;
    day=days%30;
    printf("%d, %d, %d",year,month,day);
    return 1;

}