#include <iterator>
#include <cmath>
#include <list>
#include <stack>

#include "../cs225/PNG.h"
#include "../Point.h"

#include "ImageTraversal.h"
#include "DFS.h"

/**
 * Initializes a depth-first ImageTraversal on a given `png` image,
 * starting at `start`, and with a given `tolerance`.
 */
DFS::DFS(const PNG & png, const Point & start, double tolerance) {  
  /** @todo [Part 1] */
  start_=start;
  png_=png;
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
DFS::~DFS(){

}
/**
 * Returns an iterator for the traversal starting at the first point.
 */


ImageTraversal::Iterator DFS::begin() {
  /** @todo [Part 1] */
  DFS* ptr=new DFS(png_,start_,tolerance_);
  return ImageTraversal::Iterator(*ptr,start_);
}

/**
 * Returns an iterator for the traversal one past the end of the traversal.
 */
ImageTraversal::Iterator DFS::end() {
  /** @todo [Part 1] */
  return ImageTraversal::Iterator();
}
double DFS::get_t() const{
  return tolerance_;

}

/**
 * Adds a Point for the traversal to visit at some point in the future.
 */
void DFS::add(const Point & point) {
  /** @todo [Part 1] */
  travel.push(point);
}

/**
 * Removes and returns the current Point in the traversal.
 */
Point DFS::pop() {
  /** @todo [Part 1] */
  Point s=travel.top();
  travel.pop();
  return s;
}

/**
 * Returns the current Point in the traversal.
 */
Point DFS::peek() const {
  /** @todo [Part 1] */
  return travel.top();
}

/**
 * Returns true if the traversal is empty.
 */
bool DFS::empty() const {
  /** @todo [Part 1] */
  return travel.empty();
}

bool DFS::getvisit(unsigned x, unsigned y){
  return v[x][y];

}
void DFS::change(unsigned x, unsigned y){
  v[x][y]=true;
 
  
  
}
PNG* DFS::read_p(){
  return &png_;
}
