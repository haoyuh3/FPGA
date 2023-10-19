/**
 * @file common_words.cpp
 * Implementation of the CommonWords class.
 *
 * @author Zach Widder
 * @date Fall 2014
 */

#include "common_words.h"

#include <fstream>
#include <string>
#include <vector>
#include <iostream>
#include <iterator>
#include <algorithm>

using std::string;
using std::vector;
using std::ifstream;
using std::cout;
using std::endl;
using std::feof;

std::string remove_punct(const string& str)
{
    string ret;
    std::remove_copy_if(str.begin(), str.end(), std::back_inserter(ret),
                        IsPunct());
    return ret;
}

CommonWords::CommonWords(const vector<string>& filenames)
{
    // initialize all member variables
    init_file_word_maps(filenames);
    init_common();
}

void CommonWords::init_file_word_maps(const vector<string>& filenames)
{
    // make the length of file_word_maps the same as the length of filenames
    file_word_maps.resize(filenames.size());

    // go through all files
    for (size_t i = 0; i < filenames.size(); i++) {
        // get the corresponding vector of words that represents the current
        // file
        vector<string> words = file_to_vector(filenames[i]);
        /* Your code goes here! */
        
        for(size_t j=0; j<words.size();j++){
            file_word_maps[i][words[j]]++;
            //interator
        }
    }
}

void CommonWords::init_common()
{
    /* Your code goes here! */
    for(auto &map_: file_word_maps){
        for(auto &elem:map_){
            // map<string, unsigned int>::iterator look = common.find(elem.first);
            // if (look != common.end())
            //     common[elem.first] += 1;
            // else 
            //     common[elem.first] = 1;
            common[elem.first]++;
        }
    }
    
}

/**
 * @param n The number of times to word has to appear.
 * @return A vector of strings. The vector contains all words that appear
 * in each file >= n times.
 */
vector<string> CommonWords::get_common_words(unsigned int n) const
{
    vector<string> out;
    /* Your code goes here! */
    for(auto &elem:common){
        if(elem.second==file_word_maps.size()){
            bool signal=true;
            for(auto & cur: file_word_maps){
                //map<string,unsigned int> cur=file_word_maps[j];
                if(cur.at(elem.first)<n){
                    signal=false;
                    break;
                }
            }
            if (signal) {
                out.push_back(elem.first);
            }
        }
    }
    //compare time
    //  for (auto & elem: common) {
    //     if (elem.second == file_word_maps.size()) {
    //         bool should_add = true;
    //         for (auto & cur_map: file_word_maps) {
    //             if (cur_map.at(elem.first) < n) {
    //                 should_add = false;
    //                 break;
    //             }   
    //         }
    //         if (should_add) {
    //             out.push_back(elem.first);
    //         }
    //     }
    // }
    

    return out;
}

/**
 * Takes a filename and transforms it to a vector of all words in that file.
 * @param filename The name of the file that will fill the vector
 */
vector<string> CommonWords::file_to_vector(const string& filename) const
{
    ifstream words(filename);
    vector<string> out;

    if (words.is_open()) {
        std::istream_iterator<string> word_iter(words);
        while (!words.eof()) {
            out.push_back(remove_punct(*word_iter));
            ++word_iter;
        }
    }
    return out;
}
