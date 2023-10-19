#ifndef cs225_STICKERSHEET_H
#define cs225_STICKERSHEET_H
#include "Image.h"
#include <iostream>
namespace cs225{
    class StickerSheet{
        public:
                StickerSheet();
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
                unsigned  max_;
                unsigned  num;
                
                unsigned * xx_cor;
                unsigned * yy_cor;
                Image* base;
                Image** array;
                void copy_(const StickerSheet& other);
                void clean();
                

    };
}
#endif

