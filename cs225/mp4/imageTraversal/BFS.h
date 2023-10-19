#ifndef BFS_H
#define BFS_H

#include <iterator>
#include <cmath>
#include <list>
#include <queue>
#include <vector>

#include "../cs225/PNG.h"
#include "../Point.h"

#include "ImageTraversal.h"

using namespace cs225;

/**
 * A breadth-first ImageTraversal.
 */
class BFS : public ImageTraversal {
public:
  BFS(const PNG & png, const Point & start, double tolerance);
  ~BFS();
  ImageTraversal::Iterator begin();
  ImageTraversal::Iterator end();
  
  void add(const Point & point);
  Point pop();
  Point peek() const;
  bool empty() const;
  PNG*  read_p();
  bool getvisit(unsigned x, unsigned y);
  void change(unsigned x, unsigned y);
  double get_t() const;
private:
  PNG p_;
  Point start_;
  double tolerance_;
  queue<Point> travel;
  vector<vector<bool> > v;

};

#endif
