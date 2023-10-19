/* Your code here! */
#include "maze.h"
#include "dsets.h"
#include <stack>
#include <map>
using namespace ::cs225;
using namespace::std;
SquareMaze::SquareMaze(){
    height=0;
    width=0;
    //size=0;
}
SquareMaze::SquareMaze(int w, int h){
    height=h;
    width=w;
    //size=w*h;
}
//input: x, y current cordinate
//dir : direction
//exists: whether to set

//in walls first element is down or up
//second is right or left
void SquareMaze::setWall(int x, int y, int dir, bool exists){
    if(dir!=1 && dir !=0){
        return;
    }
    //go right
    if(dir==0){
        walls[width*y+x].first=exists;
        return;
    }
    if(dir==1){
        walls[width*y+x].second=exists;
    }
}

bool SquareMaze::canTravel(int x, int y, int dir)const{
    int temp=y*width+x;
    if(dir==0){
        return !(walls[temp].first);
    }
    if(dir==1){
        return !(walls[temp].second);
    }
    //can go left
    //first go left and judge if it can go right
    if(dir==2){
        //int t1=width*(y)+x-1;
        int t1=get_left(x,y);
        if(temp!=t1){
            return !(walls[t1].first);
        }
        return false;
    }
    if(dir==3){
        //int t2=width*(y-1)+x;
        int t2=get_up(x,y);
        if(t2!=temp){
      return !(walls[t2].second);
    }
    }
    return false;
}

//input w:width h:height
void SquareMaze::makeMaze(int w, int h){
    height=h;
    width=w;
    size=w*h;
    visited.resize(size);
    walls.resize(size);
    for(unsigned i=0; i<size; i++){
        walls[i].first=true;
        walls[i].second=true;
        visited[i]=false;
    }
    
    std::stack<int> s;//for travel
    DisjointSets setd;
    setd.addelements(size);
    s.push(0);
    while(!s.empty()){
        cur=s.top();
        s.pop();
        setd.setunion(0,cur);
        std::pair<int,int> cur_point=get_point(cur);

        int random=std::rand();
        if(random%2==0){
            if(!havesame_root(setd,get_loc(cur_point.first,cur_point.second),get_right(cur_point.first,cur_point.second))){
                setWall(cur_point.first,cur_point.second,0,false);//remove right walll
                 s.push(get_right(cur_point.first,cur_point.second));
            }
            if(!havesame_root(setd,get_loc(cur_point.first,cur_point.second),get_down(cur_point.first,cur_point.second))){
                setWall(cur_point.first,cur_point.second,1,false);//remove down walll
                 s.push(get_down(cur_point.first,cur_point.second));
            }

        }else{
            if(!havesame_root(setd,get_loc(cur_point.first,cur_point.second),get_down(cur_point.first,cur_point.second))){
                setWall(cur_point.first,cur_point.second,1,false);//remove down walll
                 s.push(get_down(cur_point.first,cur_point.second));
            }
            if(!havesame_root(setd,get_loc(cur_point.first,cur_point.second),get_right(cur_point.first,cur_point.second))){
                setWall(cur_point.first,cur_point.second,0,false);//remove right walll
                 s.push(get_right(cur_point.first,cur_point.second));
            }

        }
    }
}
 







cs225::PNG * SquareMaze::drawMaze() const {
  
  PNG* ret= new PNG((width * 10) + 1, (height * 10) + 1);
  for(int i =0; i<height*10+1;i++){
    ret->getPixel(0,i)->l=0.0;
  }
 
 

  for (int i = 10; i < (width * 10) + 1; i++){
    ret->getPixel(i,0)->l=0;
  }

  
  for(int i=0; i<width; i++){
    for(int j=0; j<height; j++){
      if(walls[get_loc(i,j)].first){
        for(int h=0;h<11;h++){
          ret->getPixel((10 * i) + 10, (10 * j) + h)->l = 0.0;
        }

      }
      if(walls[get_loc(i,j)].second){
        for(int h=0;h<11;h++){
          ret->getPixel((10*i)+h,(10 * j) + 10)->l=0.0;
        }
      }
    }
  }
  
  return ret;
}



PNG * SquareMaze::drawMazeWithSolution()
{
    int y = 5;
    int x = 5;
    //Start at pixel (5,5)
    vector<int> p = solveMaze();
    // p represent the direction
    PNG* out = drawMaze();
    
    for (size_t i=0; i < p.size(); i++){
        if (p[i] == 1){
            for (int j = 0; j <= 10; j++){
                HSLAPixel *cur_pixel = out->getPixel(x, j+ y);
                cur_pixel -> h = 0;
                cur_pixel -> s = 1;
                cur_pixel -> l = 0.5;
                cur_pixel -> a = 1;    
            }
            y+=10;
        }
         else if (p[i] == 0){
            for (int j = 0; j <=10; j++){
                HSLAPixel *cur_pixel = out->getPixel(x + j, y); //Red is 0,1,0.5,1  use  red to draw path
                cur_pixel -> h = 0;
                cur_pixel -> s = 1;
                cur_pixel -> l = 0.5;
                cur_pixel -> a = 1;  
            }
            x+=10;
        }
        else if (p[i] == 2){
            for (int j = 0; j <= 10; j++){
                HSLAPixel *cur_pixel = out->getPixel(x-j, y);
                cur_pixel -> h = 0;
                cur_pixel -> s = 1;
                cur_pixel -> l = 0.5;
                cur_pixel -> a = 1;    
            }
            x-=10;

        }
        else {
            for (int j = 0; j <=10; j++){
                HSLAPixel *cur_pixel = out->getPixel(x, y-j);
                
                cur_pixel -> l = 0.5;
                cur_pixel -> a = 1;  
                cur_pixel -> h = 0;
                cur_pixel -> s = 1;  
            }
            y -= 10;
        }
    }
    for (int i = 1; i < 10; i++){
        HSLAPixel *cur_pixel = out->getPixel(x / 10 * 10 + i, height  * 10);
        
        cur_pixel -> l = 1;
        cur_pixel -> a = 1;  
        cur_pixel -> h = 0;
        cur_pixel -> s = 0;   
    }

  return out;
}









//helper fun

bool SquareMaze::havesame_root(DisjointSets&s, int x, int y){
    if(s.find(x)==s.find(y)){
        return true;
    }
    return false;
}

std:: pair<int,int> SquareMaze::get_point(int x){
    return std::pair<int, int>(x%width,x/width);
}

int SquareMaze::get_loc(int x, int y)const{
    return x+y*width;
}

int SquareMaze::get_down(int x, int y)const
{
  if(y+1==height)return get_loc(x,y);
  return (width*(y+1))+x;
}

int SquareMaze::get_up(int x, int y)const
{
  if(y-1<0)return get_loc(x,y);
  return (width*(y-1))+x;
}

int SquareMaze::get_right(int x, int y)const
{
  if(x+1==width){
    return get_loc(x,y);
  }
  return (width*y)+x+1;
}

int SquareMaze::get_left(int x, int y)const
{
  if(x-1<0){
    return get_loc(x,y);
    }
  return (width*y)+x-1;
}

bool SquareMaze::cantravel_point(int start, int dir){
  pair<int,int> c_point=get_point(start);
  return canTravel(c_point.first,c_point.second,dir);
}



// void SquareMaze::next_step(stack<int> s, int *dist){
//   int len = 0;
//   dist[0] = 0;
//   int location;

//   if(visited[0]==false){
//     visited[0]=true;
//     while(!s.empty()){
//       location=s.top();
//       s.pop();
//       len=dist[location];
//       //travel right
//       if(cantravel_point(location,0) && !visited[location+1]){
//         dist[location+1]=len+1;
//         visited[location+1]=true;
//         s.push(location+1);
//       }
//       //travel down
//       if(cantravel_point(location,1) && !visited[location+width]){
//         dist[location+width]=len+1;
//         visited[location+width]=true;
//         s.push(location+width);
//       }
//       //travel left
//       if(cantravel_point(location,2) && !visited[location-1]){
//         dist[location-1]=len+1;
//         visited[location-1]=true;
//         s.push(location-1);
//       }
//       if(cantravel_point(location,3) && !visited[location-width]){
//         dist[location-width]=len+1;
//         visited[location-width]=true;
//         s.push(location-width);
//       }
//     }
//   }
//   if(visited[0]==true){
//     visited[0]=false;
//     while(!s.empty()){
//       location=s.top();
//       s.pop();
//       len=dist[location];
//       //travel right
//       if(cantravel_point(location,0) && !visited[location+1]){
//         dist[location+1]=len+1;
//         visited[location+1]=false;
//         s.push(location+1);
//       }
//       //travel down
//       if(cantravel_point(location,1) && !visited[location+width]){
//         dist[location+width]=len+1;
//         visited[location+width]=false;
//         s.push(location+width);
//       }
//       //travel left
//       if(cantravel_point(location,2) && !visited[location-1]){
//         dist[location-1]=len+1;
//         visited[location-1]=false;
//         s.push(location-1);
//       }
//       if(cantravel_point(location,3) && !visited[location-width]){
//         dist[location-width]=len+1;
//         visited[location-width]=false;
//         s.push(location-width);
//       }
//     }
//   }

// }



vector<int> SquareMaze::solveMaze(){
  stack<int> s;
  vector<bool> check;
  vector<int> search_path;
  map<int,int> path;

  int max=0;
  int a_size=width*(height-1);
  for(int i = 0; i < size; i++){
		check.push_back(0);
	}
  visited[0]=1;
  s.push(0);
  while(!s.empty()){
    int point_tmp=s.top();
    int x_cur = get_point(point_tmp).first;
		int y_cur = get_point(point_tmp).second;
		s.pop();
    //go right
    if(canTravel(x_cur,y_cur,0)&&check[get_right(x_cur,y_cur)]==0){
			s.push(get_right(x_cur,y_cur));
      check[get_right(x_cur,y_cur)]=true;
			path[get_right(x_cur,y_cur)] = point_tmp;
		}
    if(canTravel(x_cur,y_cur,1)&&check[get_down(x_cur,y_cur)]==0){
			s.push(get_down(x_cur,y_cur));
      check[get_down(x_cur,y_cur)]=true;
			path[get_down(x_cur,y_cur)] = point_tmp;
		}
    if(canTravel(x_cur,y_cur,2)&&check[get_left(x_cur,y_cur)]==0){
			s.push(get_left(x_cur,y_cur));
      check[get_left(x_cur,y_cur)]=true;
			path[get_left(x_cur,y_cur)] = point_tmp;
		}
    if(canTravel(x_cur,y_cur,3)&&check[get_up(x_cur,y_cur)]==0){
			s.push(get_up(x_cur,y_cur));
      check[get_up(x_cur,y_cur)]=true;
			path[get_up(x_cur,y_cur)] = point_tmp;
		}
  }
  for(int i=0; i<width; i++){
    int dest=a_size+i;
    int length=0;
    vector<int> check_longest;
    while(dest!=0){
      length++;
      //check if cna go right
      if(dest - path[dest] == 1){
				check_longest.push_back(0);
			}
      else if(dest - path[dest] == -1){
				check_longest.push_back(2);
			}
      else if(dest - path[dest] == width){
				check_longest.push_back(1);
			}
      else{
				check_longest.push_back(3);
			}
      dest=path[dest];
    }
    if(length>max){
      max=length;
      search_path=check_longest;
    }
  }
  vector<int> ret;
	while (!search_path.empty())
  {
      ret.push_back(search_path.back());
      search_path.pop_back();
    }
	return ret;
}




