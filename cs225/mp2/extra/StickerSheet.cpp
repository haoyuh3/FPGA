
#include "StickerSheet.h"
namespace cs225{
    StickerSheet::StickerSheet(const Image &picture, unsigned max){
            max_=max;
            base =new Image(picture);
            ptr->xx_cordinate=0;
            ptr->yy_cordinate=0;
            ptr->pic=nullptr;
            array=new image* [max];
            array[0]=ptr;
            num=1;

               
    }
    void StickerSheet::copy_(const StickerSheet& other){
        max_=other.max_;
        num=other.num;
        base=new Image(*(other.base));
        array=new image*[max_];
        for(unsigned int i= 0; i<num;i++){
            array[i]->xx_cordinate=other.array[i]->xx_cordinate;
            array[i]->yy_cordinate=other.array[i]->yy_cordinate;
            *(array[i]->pic)=*(other.array[i]->pic);


        }
    }
     void StickerSheet::clean(){
        delete base;
        for(unsigned int i=0; i<num;i++){
            delete array[i];
            array[i]->pic=nullptr;
        }
        delete[] array;
        
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
        StickerSheet temp=*this;
        delete[] array;
        array= new image*[max];
        if(max>max_){
            for(unsigned int i=0;i<num;i++){
                array[i]->xx_cordinate=temp.array[i]->xx_cordinate;
                array[i]->yy_cordinate=temp.array[i]->yy_cordinate;
                *(array[i]->pic)=*(temp.array[i]->pic);
            }
            max_=max;


        }else{
            
            for(unsigned int i=max; i<num;i++){
                delete temp.array[i];
                temp.array[i]->pic=nullptr;
            }
            max_=max;
            num=max_;
            for(unsigned int i=0;i<num;i++){
                array[i]->xx_cordinate=temp.array[i]->xx_cordinate;
                array[i]->yy_cordinate=temp.array[i]->yy_cordinate;
                *(array[i]->pic)=*(temp.array[i]->pic);
            }
            
        }
        
    }

}