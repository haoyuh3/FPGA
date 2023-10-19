#include <iostream> 
using namespace std;
#include <cstdlib>
#include <cmath>

#include "cs225/PNG.h"
#include "cs225/HSLAPixel.h"
using namespace cs225;

// sets up the output image
PNG* setupOutput(unsigned w, unsigned h) {
    PNG* image = new PNG(w, h);
    return image;
}

// Returns my favorite color
HSLAPixel* myFavoriteColor(double saturation) {
    HSLAPixel* ptr=new HSLAPixel(-1, saturation, 0.5);
    
    return ptr;
}

void sketchify(std::string inputFile, std::string outputFile) {
    // Load in.png
    PNG* original=new PNG();
    original->readFromFile(inputFile);
    //cout<<"reach line23"<<endl;
    unsigned width = original->width();
    unsigned height = original->height();
    //cout<<"reach line27"<<endl;
    // Create out.png
    PNG* output=setupOutput(width, height);
    
    // Load our favorite color to color the outline
    HSLAPixel* myPixel = myFavoriteColor(0.5);
    //cout<<"reach 39"<<endl;
    // Go over the whole image, and if a pixel differs from that to its upper
    // left, color it my favorite color in the output
    for (unsigned y = 1;  y < height; y++) {
        for (unsigned x = 1; x < width; x++) {
            // Calculate the pixel difference
            //cout<<"reach 45"<<endl;
            HSLAPixel* prev = original->getPixel(x - 1, y - 1);
            HSLAPixel* curr = original->getPixel(x, y);
            double diff = std::fabs(curr->h - prev->h);

            // If the pixel is an edge pixel,
            // color the output pixel with my favorite color
            HSLAPixel* currOutPixel = (*output).getPixel(x, y);
            if (diff > 20) {
                currOutPixel->a = myPixel->a;
                currOutPixel->s = myPixel->s;
                currOutPixel->l = myPixel->l;
                currOutPixel->h = myPixel->h;
            }
            //cout<<"reach line59"<<endl;
        }
    }

    // Save the output file
    output->writeToFile(outputFile);

    // Clean up memory
    delete myPixel;
    delete output;
    delete original;
}
