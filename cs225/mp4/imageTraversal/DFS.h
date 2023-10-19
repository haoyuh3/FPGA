#ifndef DFS_H
#define DFS_H

#include <iterator>
#include <cmath>
#include <list>
#include <stack>
#include <vector>

#include "../cs225/PNG.h"
#include "../Point.h"

#include "ImageTraversal.h"

using namespace cs225;

/**
 * A depth-first ImageTraversal.
 */
class DFS : public ImageTraversal {
public:
  DFS(const PNG & png, const Point & start, double tolerance);
  
  ImageTraversal::Iterator begin();
  ImageTraversal::Iterator end();
  ~DFS();
  void add(const Point & point);
  Point pop();
  Point peek() const;
  bool empty() const;
  PNG*  read_p();
  bool getvisit(unsigned x, unsigned y);
  void change(unsigned x, unsigned y);
  double get_t() const;
private:
  PNG png_;
  Point start_;
  double tolerance_;
  vector<vector<bool> > v;
  stack<Point> travel;
  
};

#endif
