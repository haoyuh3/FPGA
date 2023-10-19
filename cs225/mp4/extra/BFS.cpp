
#include <iterator>
#include <cmath>
#include <list>
#include <queue>
#include <vector>

#include "../cs225/PNG.h"
#include "../Point.h"

#include "ImageTraversal.h"
#include "BFS.h"

using namespace cs225;

/**
 * Initializes a breadth-first ImageTraversal on a given `png` image,
 * starting at `start`, and with a given `tolerance`.
 */
BFS::BFS(const PNG & png, const Point & start, double tolerance) {  
  /** @todo [Part 1] */
  p_=png;
  start_=start;
  tolerance_=tolerance;
  travel.push(start);
  v.resize(png.width());
  for(unsigned int i=0; i< png.width();i++){
    v[i].resize(png.height());
    for(unsigned int j=0; j<png.height();j++){
      v[i][j]=false;
    }
  }
  v[start.x][start.y]=true;
}
BFS::~BFS(){

}

/**
 * Returns an iterator for the traversal starting at the first point.
 */
ImageTraversal::Iterator BFS::begin() {
  /** @todo [Part 1] */
  BFS* ptr=new BFS(p_,start_,tolerance_);
  return ImageTraversal::Iterator(*ptr, start_);
}

/**
 * Returns an iterator for the traversal one past the end of the traversal.
 */
ImageTraversal::Iterator BFS::end() {
  /** @todo [Part 1] */
  return ImageTraversal::Iterator();
}
double BFS::get_t() const{
  return tolerance_;
}

/**
 * Adds a Point for the traversal to visit at some point in the future.
 */
void BFS::add(const Point & point) {
  /** @todo [Part 1] */
  travel.push(point);
}

/**
 * Removes and returns the current Point in the traversal.
 */
Point BFS::pop() {
  /** @todo [Part 1] */
  Point t=travel.front();
  travel.pop();

  return t;
}

/**
 * Returns the current Point in the traversal.
 */
Point BFS::peek() const {
  /** @todo [Part 1] */
  return travel.front();
}

/**
 * Returns true if the traversal is empty.
 */
bool BFS::empty() const {
  /** @todo [Part 1] */
  return travel.empty();
}

bool BFS::getvisit(unsigned x, unsigned y){
  return v[x][y];

}
void BFS::change(unsigned x, unsigned y){
 
    v[x][y]=true;
  
}
PNG* BFS::read_p(){
  return &p_;
}
