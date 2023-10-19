/**
 * @file maptiles.cpp
 * Code for the maptiles function.
 */

#include <iostream>
#include <map>
#include "maptiles.h"

using namespace std;

Point<3> convertToLAB(HSLAPixel pixel) {
    Point<3> result(pixel.h/360, pixel.s, pixel.l);
    return result;
}

MosaicCanvas* mapTiles(SourceImage const& theSource,
                       vector<TileImage>& theTiles)
{
    /**
     * @todo Implement this function!
     */
     vector<Point<3>> points;

    map<Point<3>, TileImage*> hash;
    for(size_t i=0; i<theTiles.size();i++){
        HSLAPixel P=theTiles[i].getAverageColor();
        Point<3> point_=convertToLAB(P);
        points.push_back(point_);
        hash[point_]=&theTiles[i];
    }

    KDTree<3> color_kdtree(points);
    int row=theSource.getRows();
    int column=theSource.getColumns();
    MosaicCanvas * canvas = new MosaicCanvas(row, column);

    for(int i=0; i<row; i++){
        for(int j=0; j<column; j++){
            Point<3> goal=convertToLAB(theSource.getRegionColor(i,j));
            Point<3> best_neighbor=color_kdtree.findNearestNeighbor(goal);

            TileImage* correct_ = hash[best_neighbor];
            canvas->setTile(i, j, correct_);
        }
    }


    return canvas;
}

TileImage* get_match_at_idx(const KDTree<3>& tree,
                                  map<Point<3>, int> tile_avg_map,
                                  vector<TileImage>& theTiles,
                                  const SourceImage& theSource, int row,
                                  int col)
{
    // Create a tile which accurately represents the source region we'll be
    // using
    HSLAPixel avg = theSource.getRegionColor(row, col);
    Point<3> avgPoint = convertToLAB(avg);
    Point<3> nearestPoint = tree.findNearestNeighbor(avgPoint);

    // Check to ensure the point exists in the map
    map< Point<3>, int >::iterator it = tile_avg_map.find(nearestPoint);
    if (it == tile_avg_map.end())
        cerr << "Didn't find " << avgPoint << " / " << nearestPoint << endl;

    // Find the index
    int index = tile_avg_map[nearestPoint];
    return &theTiles[index];

}
