#include <iostream>
#include <string>
#include "cs225/PNG.h"
#include "cs225/PNG.h"
#include "cs225/HSLAPixel.h"
#include "mp1.h"
using namespace cs225;
void rotate(std::string inputFile, std::string outputFile) {
    cs225::PNG png,out;
    out.readFromFile(inputFile);
    png.readFromFile(inputFile);
    for(unsigned x=0; x < png.width(); x++){
    for(unsigned y=0; y< png.height(); y++){
        HSLAPixel *pixel = png.getPixel(x, y);
        HSLAPixel *r_pixel=out.getPixel(png.width()-x-1,png.height()-y-1);
        r_pixel->a=pixel->a;
        r_pixel->s=pixel->s;
        r_pixel->h=pixel->h;
        r_pixel->l=pixel->l;
    }
  }
    //printf("s");
    out.writeToFile(outputFile);

}
