#include "../cs225/HSLAPixel.h"
#include "../Point.h"

#include "ColorPicker.h"
#include "MyColorPicker.h"

using namespace cs225;

/**
 * Picks the color for pixel (x, y).
 */
HSLAPixel MyColorPicker::getColor(unsigned x, unsigned y) {
  /* @todo [Part 3] */
  if(s==1){
    HSLAPixel new_p(360,1,0.5);
    s=0;
    return new_p;
  }
    HSLAPixel new_p(0,0,0);
    s=1;
  
  
  
  return new_p;
}
