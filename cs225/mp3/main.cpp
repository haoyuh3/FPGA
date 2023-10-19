#include "list.h"
#include <iostream>
int main() {
  
  List<int> list;
  List<int> list2;

  //for (unsigned i =2 ; i < 4; i++) { list.insertBack(2*i); }
  // for(unsigned i =2 ; i < 4; i++){list.insertBack(2); }
  // list.insertBack(3);
  // list.print(cout);
  // printf("\n");
  //list.reverseNth(3);
  // for(int i=0;i<10;i++){
    
  //for (unsigned i = 2; i <9; i++) { list2.insertBack(2*i+1); }
  //  for(unsigned i =2 ; i < 4; i++){list2.insertBack(3); }
  // list2.insertBack(4);
  //list2.insertBack(20);
   //list2.print(cout);
  // printf("\n");
  //list.mergeWith(list2);
  // 
  //printf("\n");
  //list.print(cout);
  //printf("\n");
  //list2.print(cout);
  int a[4]={3,6,5,8};
  for(unsigned i =0 ; i < 4; i++){list.insertBack(a[i]); }
  list.print(cout);
  list.sort();
  list.print(cout);
  return 0;
}
