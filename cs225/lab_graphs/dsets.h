/* Your code here! */
/* Your code here! */
#ifndef _DEST_H_
#define _DEST_H_
#include <vector>
using std::vector;
class DisjointSets
{
    private:
    vector<int> v;
    int size;

    public:
    void addelements(int num);
    int find(int index);
    void setunion(int a, int b);



};
#endif