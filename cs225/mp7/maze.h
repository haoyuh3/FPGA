/* Your code here! */
#include "cs225/PNG.h"
#include "dsets.h"
#include <vector>
#include <stack>
using namespace:: std;
class SquareMaze
{
    public:
    int height;
    int width;
    int size;
    SquareMaze();
    SquareMaze(int width, int height);
    void makeMaze(int x, int y);
    bool canTravel(int x, int y, int dir)const;
    void setWall(int x, int y, int dir, bool exists);
    vector<int> solveMaze();
    cs225::PNG * drawMaze()const;
    cs225::PNG * drawMazeWithSolution();
    vector<pair<bool , bool >> walls;
    vector<bool> visited;
    
    int cur;

    //helper function  have same root
    bool havesame_root(DisjointSets& s, int a, int b);

    //tranfer to point
    std::pair<int,int> get_point(int a);

    int get_loc(int x,int y)const;
    int get_right(int x, int y)const;
    int get_left(int x, int y)const;
    int get_up(int x, int y)const;
    int get_down(int x, int y)const;

    //helper function test start point can travel;
    bool cantravel_point(int start, int dir);


    void next_step(stack<int>s,int *dist);
};