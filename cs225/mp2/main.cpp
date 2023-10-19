#include "Image.h"
#include "StickerSheet.h"
using namespace cs225;
int main() {
  Image i;
  i.readFromFile("i.png");
  Image earth;
  earth.readFromFile("earth.png");
  
  
  Image a;
  a.readFromFile("alma.png");
  //printf("ewidth = %u eheight = %u\n", earth.width(), earth.height());
  earth.scale(0.1);
  Image z;
  z.readFromFile("yellow.png");
  z.resize(z.width(),z.height()/2);
  StickerSheet sheet(a, 5);
  
  printf("2\n");
  sheet.changeMaxStickers(4);
  printf("3\n");
  printf("%d\n",sheet.addSticker(i, 20, 200));
  
  printf("%d\n",sheet.addSticker(earth,20,100));
  sheet.addSticker(z,120,100);
  Image pic=sheet.render();
  pic.writeToFile("myImage.png");
  return 0;

}
