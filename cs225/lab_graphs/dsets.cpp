/* Your code here! */

#include<vector>
#include "dsets.h"

using namespace  std;
void DisjointSets::addelements(int num){
    for( int i=0; i<num; i++){
        v.push_back(-1);
    }

}
int DisjointSets::find(int index){
    if(v[index]<0){return index;}
    else {return find(v[index]);}
}

void DisjointSets::setunion(int a, int b){
    //if have same root then return
    int temp1 = find(a);
    int temp2 = find(b);
    if(temp1==temp2)return;
    ////updating size if one size is larger
    if(v[temp1]>v[temp2])
    { 
    v[temp2]+=v[temp1];
    v[temp1]=temp2;//copy temp1  to temp2
    
    return;
  }
  v[temp1]+=v[temp2];//updating size
  v[temp2]=temp1;//copy temp2 points to temp1
  
}
