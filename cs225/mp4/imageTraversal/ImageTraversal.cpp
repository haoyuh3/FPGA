#include <cmath>
#include <iterator>
#include <iostream>

#include "../cs225/HSLAPixel.h"
#include "../cs225/PNG.h"
#include "../Point.h"

#include "ImageTraversal.h"

/**
 * Calculates a metric for the difference between two pixels, used to
 * calculate if a pixel is within a tolerance.
 * 
 * @param p1 First pixel
 * @param p2 Second pixel
 */
 ImageTraversal::~ImageTraversal(){

}
double ImageTraversal::calculateDelta(const HSLAPixel & p1, const HSLAPixel & p2) {
  double h = fabs(p1.h - p2.h);
  double s = p1.s - p2.s;
  double l = p1.l - p2.l;

  // Handle the case where we found the bigger angle between two hues:
  if (h > 180) { h = 360 - h; }
  h /= 360;

  return sqrt( (h*h) + (s*s) + (l*l) );    
}

// ImageTraversal::~ImageTraversal(){

// }

/**
 * Default iterator constructor.
 */
ImageTraversal::Iterator::Iterator() :travel(),finished(true) {
  /** @todo [Part 1] */
  //travel=NULL;
  //finished=true;

}
ImageTraversal::Iterator::Iterator(ImageTraversal & traversal, Point  t) :travel(&traversal),start(t),finished(false){
  cur=traversal.peek();
  
}
ImageTraversal::Iterator::~Iterator(){
  if(travel !=NULL){delete travel;}
  travel=NULL;
}


/**
 * Iterator increment opreator.
 *
 * Advances the traversal of the image.
 */
ImageTraversal::Iterator & ImageTraversal::Iterator::operator++() {
  /** @todo [Part 1] */
  Point c=travel->pop();
  travel->change(c.x,c.y);
  HSLAPixel* start_p=travel->read_p()->getPixel(start.x,start.y);
  //four point 
  Point right(c.x+1,c.y);
  Point top(c.x,c.y+1);
  Point left(c.x-1,c.y);
  Point down(c.x,c.y-1);
  if(right.x<travel->read_p()->width()){
    HSLAPixel* cur_p=travel->read_p()->getPixel(right.x,right.y);
    double d= calculateDelta(*start_p,*cur_p);
    if(d<travel->get_t()){
      travel->add(right);
    }

  }
  if(top.y<travel->read_p()->height() ){
    HSLAPixel* cur_p=travel->read_p()->getPixel(top.x,top.y);
    double d= calculateDelta(*start_p,*cur_p);
    if(d<travel->get_t()){
      travel->add(top);
    }

  }
  if(left.x<travel->read_p()->width() ){
    HSLAPixel* cur_p=travel->read_p()->getPixel(left.x,left.y);
    double d= calculateDelta(*start_p,*cur_p);
    if(d<travel->get_t()){
      travel->add(left);
    }

  }
  if(down.y<travel->read_p()->height()){
    HSLAPixel* cur_p=travel->read_p()->getPixel(down.x,down.y);
    double d= calculateDelta(*start_p,*cur_p);
    if(d<travel->get_t()){
      travel->add(down);
    }

  }
  while( !(travel->empty())&&(travel->getvisit(travel->peek().x,travel->peek().y))){
    travel->pop();
  }
  if(travel->empty()){
    finished=true;
    return *this;
  }
  cur=travel->peek();
  return *this;
}

/**
 * Iterator accessor opreator.
 * 
 * Accesses the current Point in the ImageTraversal.
 */
Point ImageTraversal::Iterator::operator*() {
  /** @todo [Part 1] */
  
  return cur;
}

/**
 * Iterator inequality operator.
 * 
 * Determines if two iterators are not equal.
 */
bool ImageTraversal::Iterator::operator!=(const ImageTraversal::Iterator &other) {
  /** @todo [Part 1] */
  // Point o_begin=other.start;
  // Point begin=start;
  //return false;
  return !( finished && other.finished);
  
}




// ImageTraversal::~ImageTraversal() {
// 	// Nothing
// }

// /**
//  * Calculates a metric for the difference between two pixels, used to
//  * calculate if a pixel is within a tolerance.
//  * 
//  * @param p1 First pixel
//  * @param p2 Second pixel
//  * @return the difference between two HSLAPixels
//  */
// double ImageTraversal::calculateDelta(const HSLAPixel & p1, const HSLAPixel & p2) {
//   double h = fabs(p1.h - p2.h);
//   double s = p1.s - p2.s;
//   double l = p1.l - p2.l;

//   // Handle the case where we found the bigger angle between two hues:
//   if (h > 180) { h = 360 - h; }
//   h /= 360;

//   return sqrt( (h*h) + (s*s) + (l*l) );    
// }

// /**
//  * Default iterator constructor.
//  */
// ImageTraversal::Iterator::Iterator() : travel(), finished(true) {
//   // Nothing
// }

// ImageTraversal::Iterator::Iterator(ImageTraversal & traversal, Point t) 
// 	:travel(&traversal), start(t), finished(false) {
// 	cur = traversal.peek();
// }

// ImageTraversal::Iterator::~Iterator() {
// 	if (travel != NULL) {delete travel;}
// 	travel = NULL;
// }


/**
 * Iterator increment opreator.
 *
 * Advances the traversal of the image.
 */
// ImageTraversal::Iterator & ImageTraversal::Iterator::operator++() {

//   	Point curtop = travel->pop();
//   	travel->change(curtop.x, curtop.y);
  	
//   	Point right(curtop.x + 1, curtop.y);
//   	Point below(curtop.x, curtop.y + 1);
//   	Point lefft(curtop.x - 1, curtop.y);
//   	Point above(curtop.x, curtop.y - 1);
//   	HSLAPixel * startingPixel = travel->read_p()->getPixel(start.x, start.y);
//     // insert the point in order 
//   	// Right case
//   	if ( right.x < travel->read_p()->width() ) {
//   		HSLAPixel * pixelInQuestion = travel->read_p()->getPixel(right.x, right.y);
//   		double delta = calculateDelta(*startingPixel, *pixelInQuestion);
//   		if (delta < travel->get_t()) {
//   			travel->add(right);
//   		}
//   	}
//   	// Below case
//   	if ( below.y < travel->read_p()->height() ) {
//   		HSLAPixel * pixelInQuestion = travel->read_p()->getPixel(below.x, below.y);
//   		double delta = calculateDelta(*startingPixel, *pixelInQuestion);
//   		if (delta < travel->get_t()) {
//   			travel->add(below);
//   		}
//   	}
//   	// Left case
//   	if ( lefft.x < travel->read_p()->width() ) {
//   		HSLAPixel *pixelInQuestion = travel->read_p()->getPixel(lefft.x, lefft.y);
//   		double delta = calculateDelta(*startingPixel, *pixelInQuestion);
//   		if (delta < travel->get_t()) {
//   			travel->add(lefft);
//   		}
//   	}
//   	// Above case
//   	if ( above.y < travel->read_p()->height() ) {
//   		HSLAPixel * pixelInQuestion = travel->read_p()->getPixel(above.x, above.y);
//   		double delta = calculateDelta(*startingPixel, *pixelInQuestion);
//   		if (delta < travel->get_t()) {
//   			travel->add(above);
//   		}
//   	}
//   	while ( !(travel->empty()) && (travel->getvisit(travel->peek().x, travel->peek().y))) {
//   		travel->pop();
//   	}
//   	if (travel->empty()) {
//   		finished = true;
//   		return *this;
//   	}
//   	cur = travel->peek();
//   	return *this;
// }

// /**
//  * Iterator accessor opreator.
//  * 
//  * Accesses the current Point in the ImageTraversal.
//  */
// Point ImageTraversal::Iterator::operator*() {
//   	return cur;
// }

// /**
//  * Iterator inequality operator.
//  * 
//  * Determines if two iterators are not equal.
//  */
// bool ImageTraversal::Iterator::operator!=(const ImageTraversal::Iterator &other) {
//   	/*
//   	bool thisEmpty = false;
//   	bool otherEmpty = false;
//   	if (traversal == NULL) {thisEmpty = true;}
//   	if (other.traversal == NULL) {otherEmpty = true;}
//   	if (!thisEmpty) {thisEmpty = traversal->empty();}
//   	if (!otherEmpty) {otherEmpty = other.traversal->empty();}
//   	if (thisEmpty && otherEmpty) {return true;}
//   	else if ((!thisEmpty) && (!otherEmpty)) {return traversal != other.traversal;}
//   	else return true;
//   	*/
//   	return !(finished && other.finished);
// }