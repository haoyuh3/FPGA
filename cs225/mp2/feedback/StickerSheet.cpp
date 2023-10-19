
#include "StickerSheet.h"
namespace cs225{
    StickerSheet::StickerSheet(){
        xx_cor=new unsigned[1];
        xx_cor[0]=0;
        yy_cor=new unsigned[1];
        yy_cor[0]=0;
        max_=1;
        base=new Image();
        array=new Image*[1];
    }
    StickerSheet::StickerSheet(const Image &picture, unsigned max){
            max_=max;
            base =new Image(picture);
            
            array=new Image* [max];
            xx_cor=new unsigned [max_];
            yy_cor=new unsigned[max_];
            // xx_cor[0]=0;
            // yy_cor[0]=0;
            num=0;
            

               
    }
    void StickerSheet::copy_(const StickerSheet& other){
        max_=other.max_;
        num=other.num;
        base=new Image(*(other.base));
        array=new Image*[max_];
        xx_cor=new unsigned [max_];
        yy_cor=new unsigned[max_];
        for(unsigned int i= 0; i<num;i++){
            xx_cor[i]=other.xx_cor[i];
            yy_cor[i]=other.yy_cor[i];
            array[i]=new Image();
            *(array[i])=*(other.array[i]);



        }
    }
     void StickerSheet::clean(){
        delete base;
        for(unsigned int i=0; i<num;i++){
            delete array[i];
            array[i]=nullptr;
        }
        delete[] array;
        delete[] xx_cor;
        delete[] yy_cor;
        
    }
    StickerSheet::~StickerSheet(){
        clean();
    }  
    StickerSheet::StickerSheet(const StickerSheet& other){
        copy_(other);
    }
    const StickerSheet& StickerSheet::operator=(const StickerSheet& other){
        copy_(other);//??different
        return *this;
    }
    void StickerSheet::changeMaxStickers(unsigned max){
        Image** temp=new Image*[num];
        unsigned* xx=new unsigned[num];
        unsigned* yy=new unsigned[num];
        for(unsigned a=0;a<num;a++){
            temp[a]=array[a];
            xx[a]=xx_cor[a];
            yy[a]=yy_cor[a];
        }
        delete[] array;
        array= new Image*[max];
        delete[] xx_cor;
        delete[] yy_cor;
        xx_cor=new unsigned [max];
        yy_cor=new unsigned [max];

        if(max>=num){
            for(unsigned int i=0;i<num;i++){
                xx_cor[i]=xx[i];
                yy_cor[i]=yy[i];
                array[i]=temp[i];
            }
            max_=max;


        }else{
            for(unsigned j=max;j<num;j++){
                delete temp[j];
                temp[j]=NULL;
            }
            
            num=max;
            for(unsigned int i=0;i<num;i++){
                xx_cor[i]=xx[i];
                yy_cor[i]=yy[i];
                array[i]=temp[i];
            } 
            
        }
        max_=max;
        delete[] temp;
        delete[] xx;
        delete[] yy;
        
    }
    int StickerSheet::addSticker(Image& sticker, unsigned x, unsigned y){
        if(max_==num){return -1;}
        for(unsigned int i=0; i<max_;i++){
            if(i==num){
                Image *new_s=new Image(sticker);
                array[i]=new_s;
                xx_cor[i]=x;
                yy_cor[i]=y;
                num++;
                return int(i);

            }

        }
        return -1;
    }
    bool StickerSheet::translate(unsigned index, unsigned x, unsigned y){
        if( index<num){
            xx_cor[index]=x;
            yy_cor[index]=y;
            return true;
        }else{
            return false;
        }
    }
    Image* StickerSheet::getSticker(unsigned index)const{
        if(index < num){
            return (array[index]);
        }else{
            return NULL;
        }
    }
    void StickerSheet::removeSticker(unsigned index){
        if(index<num){
            delete array[num-1];
            array[num-1]=nullptr;

            // rest sticker
            for(unsigned int i =index; i < max_-1;i++){
                array[i]=array[i+1];
                xx_cor[i]=xx_cor[i+1];
                yy_cor[i]=yy_cor[i+1];
            }
            num--;
            //initialize max_-1?
            delete array[max_-1];
            array[max_-1]=nullptr;
            xx_cor[max_-1]=0;
            yy_cor[max_-1]=0;
        }else{
            return;
        }
    }
    Image StickerSheet::render()const{
        Image res(*base);
        for(unsigned int i=0; i<num; i++){
            Image* cur= array[i];
            unsigned int x_cur=xx_cor[i];
            unsigned int y_cur=yy_cor[i];
            //overwrite size
            if(x_cur+array[i]->width()>base->width()){res.resize(x_cur+array[i]->width(),res.height());}
            if(y_cur+array[i]->height()>base->height()){res.resize(res.width(),y_cur+array[i]->height());}
            for(unsigned int x=0; x<cur->width();x++){
                for(unsigned int y=0; y<cur->height(); y++){
                    HSLAPixel* pixel_res=res.getPixel(x_cur+x,y_cur+y);
                    HSLAPixel* sticker= cur->getPixel(x,y);
                    if(sticker->a!=0){
                   
                        pixel_res->a=sticker->a;
                        pixel_res->s=sticker->s;
                        pixel_res->h=sticker->h;
                        pixel_res->l=sticker->l;
                   
                    }
                }
            }
        }
        return res;
    }
}