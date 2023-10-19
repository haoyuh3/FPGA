/**
 * @file cartalk_puzzle.cpp
 * Holds the function which solves a CarTalk puzzler.
 *
 * @author Matt Joras
 * @date Winter 2013
 */

#include <fstream>

#include "cartalk_puzzle.h"

using namespace std;

/**
 * Solves the CarTalk puzzler described here:
 * http://www.cartalk.com/content/wordplay-anyone.
 * @return A vector of (string, string, string) tuples
 * Returns an empty vector if no solutions are found.
 * @param d The PronounceDict to be used to solve the puzzle.
 * @param word_list_fname The filename of the word list to be used.
 */
vector<std::tuple<std::string, std::string, std::string>> cartalk_puzzle(PronounceDict d,
                                    const string& word_list_fname)
{
    vector<std::tuple<std::string, std::string, std::string>> ret;

    /* Your code goes here! */
    tuple<string,string,string>res;
    string str1;
    //same as find_commonwords
    ifstream infile(word_list_fname);
    if(infile.is_open()){
        while(getline(infile,str1)){
            if(str1.size()==5){
                string str2=str1.substr(1,str1.size()-1);
                string str3=str1[0]+str1.substr(2,str1.size()-1);
                if(d.homophones(str1,str2)&&d.homophones(str1,str3)){
                    res={str1,str2,str3};
                    printf("!");
                    ret.push_back(res);
                }

            }
        }
       
    }
    infile.close();
    return ret;
}

