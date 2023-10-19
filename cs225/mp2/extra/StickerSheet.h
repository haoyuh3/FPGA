#ifndef cs225_STICKERSHEET_H
#define cs225_STICKERSHEET_H
#include "Image.h"
#include <iostream>
namespace cs225{
    class StickerSheet{
        public:
                StickerSheet (const Image &picture, unsigned max);
                ~StickerSheet();
                StickerSheet (const StickerSheet &other);
                const StickerSheet & 	operator= (const StickerSheet &other);
                void 	changeMaxStickers (unsigned max);
                int 	addSticker (Image &sticker, unsigned x, unsigned y);
                bool 	translate (unsigned index, unsigned x, unsigned y);
                void 	removeSticker (unsigned index);
                Image * 	getSticker (unsigned index) const;
                Image 	render () const;
        private:
                unsigned int max_;
                unsigned int num;
                struct image{
                  
                  Image* pic;
                  int xx_cordinate;
                  int yy_cordinate;
                };
                image* ptr;
                Image* base;
                image** array;
                void copy_(const StickerSheet& other);
                void clean();
                

    };
}
#endif

