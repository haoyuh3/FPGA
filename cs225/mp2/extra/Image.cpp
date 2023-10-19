#include "Image.h"
#include "cs225/PNG.h"

namespace cs225{
    void Image::lighten(){
       unsigned int x_width=width();
       unsigned int y_height=height();
       for(unsigned x=0; x<x_width; x++){
        for(unsigned y=0; y<y_height; y++){
            HSLAPixel* p=getPixel(x,y);
            p->l+=0.1; 
            p->l=(p->l>1)? 1:p->l;
        }
       }
    }
    void Image::lighten(double amount){
        unsigned int x_width=width();
       unsigned int y_height=height();
       for(unsigned x=0; x<x_width; x++){
        for(unsigned y=0; y<y_height; y++){
            HSLAPixel* p=getPixel(x,y);
            p->l+=amount; 
            p->l=(p->l>1)? 1:p->l;
        }
       }

    }
    void Image::darken(){
       unsigned int x_width=width();
       unsigned int y_height=height();
       for(unsigned x=0; x<x_width; x++){
        for(unsigned y=0; y<y_height; y++){
            HSLAPixel* p=getPixel(x,y);
            p->l-=0.1; 
            p->l=(p->l<0)?0:p->l;
        }
       }

    }
    void Image::darken(double amount){
       unsigned int x_width=width();
       unsigned int y_height=height();
       for(unsigned x=0; x<x_width; x++){
        for(unsigned y=0; y<y_height; y++){
            HSLAPixel* p=getPixel(x,y);
            p->l-=amount; 
            p->l=(p->l<0)?0:p->l;
        }
       }

    }
    void Image::saturate(){
       unsigned int x_width=width();
       unsigned int y_height=height();
       for(unsigned x=0; x<x_width; x++){
        for(unsigned y=0; y<y_height; y++){
            HSLAPixel* p=getPixel(x,y);
            p->s+=0.1; 
            p->s=(p->s>1)?1:p->s;
        }
       }

    }
    void Image::saturate(double amount){
       unsigned int x_width=width();
       unsigned int y_height=height();
       for(unsigned x=0; x<x_width; x++){
        for(unsigned y=0; y<y_height; y++){
            HSLAPixel* p=getPixel(x,y);
            p->s+=amount; 
            p->s=(p->s>1)?1:p->s;
        }
       }

    }

    void Image::desaturate(){
       unsigned int x_width=width();
       unsigned int y_height=height();
       for(unsigned x=0; x<x_width; x++){
        for(unsigned y=0; y<y_height; y++){
            HSLAPixel* p=getPixel(x,y);
            p->s-=0.1; 
            p->s=(p->s<0)?0:p->s;

        }
       }

    }
    void Image::desaturate(double amount){
       unsigned int x_width=width();
       unsigned int y_height=height();
       for(unsigned x=0; x<x_width; x++){
        for(unsigned y=0; y<y_height; y++){
            HSLAPixel* p=getPixel(x,y);
            p->s-=amount; 
            p->s=(p->s<0)?0:p->s;
        }
       }

    }
    void Image::grayscale(){
        for (unsigned x = 0; x < width(); x++) {
            for (unsigned y = 0; y < height(); y++) {
                HSLAPixel *pixel = getPixel(x, y);

                pixel->s = 0;
        }
       }
    }
    void Image::rotateColor(double degrees){
        for(unsigned x=0; x < width(); x++){
            for(unsigned y=0; y< height();y++){
                HSLAPixel *pixel=getPixel(x,y);
                pixel->h+=degrees;
        
                double temp =(pixel->h>360) ? pixel->h-=360 : pixel->h;
                pixel->h=temp;
                temp =(pixel->h<0) ? pixel->h+=360 : pixel->h;
                pixel->h=temp;
        }
            }


    }
    void Image::illinify(){
        for(unsigned x=0; x < width(); x++){
            for(unsigned y=0; y< height();y++){
                HSLAPixel *pixel=getPixel(x,y);
                double hue=pixel->h;
                double dis_o=(abs(hue-11)>(abs(hue-360)+11))? abs(hue-360)+11:abs(hue-11);
                double dis_b=(abs(hue-216)<(abs(hue)+144))? abs(hue-216):abs(hue)+144;
                pixel->h=(dis_o>dis_b)? 216:11;
        }
            }
    }
    void Image::scale(double factor){
        unsigned int x_new=width()*factor;
        unsigned int y_new=height()*factor;
        //mark
        Image* copy=new Image();
        *copy=*this;
        resize(x_new,y_new);
        for(unsigned x=0; x < x_new; x++){
            for(unsigned y=0; y< y_new;y++){
                HSLAPixel *pixel=getPixel(x,y);
                HSLAPixel *pixel_o=copy->getPixel(x/factor,y/factor);
                pixel->a=pixel_o->a;
                pixel->s=pixel_o->s;
                pixel->l=pixel_o->l;
                pixel->h=pixel_o->h;
        }
            }
        delete copy;
        
    }
    void Image::scale(unsigned w, unsigned h){
        Image* copy=new Image();
        *copy=*this;
        resize (w,h);
        unsigned factor_x=w/width();
        unsigned factor_y=h/height();
        for(unsigned x=0; x < w; x++){
            for(unsigned y=0; y<h;y++){
                HSLAPixel *pixel=getPixel(x,y);
                HSLAPixel *pixel_o=copy->getPixel(x/factor_x,y/factor_y);
                pixel->a=pixel_o->a;
                pixel->s=pixel_o->s;
                pixel->l=pixel_o->l;
                pixel->h=pixel_o->h;
        }
            }
        delete copy;
    }
    
}