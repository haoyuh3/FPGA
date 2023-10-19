#ifndef cs225_IMAGE_H
#define cs225_IMAGE_H
#include "cs225/PNG.h"
#include "cs225/HSLAPixel.h"
namespace cs225{
    class Image:public PNG{
    public:
        void lighten();
        void lighten(double amount);
        void darken();
        void darken(double amount);
        void saturate();
        void saturate(double amount);
        void desaturate();
        void desaturate(double amount);
        void grayscale();
        void rotateColor(double degree);
        void illinify();
        void scale(double factor);
        void scale(unsigned w, unsigned h);




    };
}

#endif