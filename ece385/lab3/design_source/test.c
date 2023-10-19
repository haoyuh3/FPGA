#include<stdio.h>
int main(){
    short a=0xf000;
    short b=0xf000;
    short out=a+b;
    printf("out:%h", out);
    printf("%x",out);


}