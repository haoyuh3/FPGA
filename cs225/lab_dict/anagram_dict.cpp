/**
 * @file anagram_dict.cpp
 * Implementation of the AnagramDict class.
 *
 * @author Matt Joras
 * @date Winter 2013
 */

#include "anagram_dict.h"

#include <algorithm> /* I wonder why this is included... */
#include <fstream>

using std::string;
using std::vector;
using std::ifstream;

/**
 * Constructs an AnagramDict from a filename with newline-separated
 * words.
 * @param filename The name of the word list file.
 */
AnagramDict::AnagramDict(const string& filename)
{
    /* Your code goes here! */
    string str1;
    ifstream infile(filename);
    
    if(infile.is_open()){
        while(getline(infile,str1)){
            string word1=str1;
            std::sort(word1.begin(),word1.end());
            dict[word1].push_back(str1);
        }
        
    }
    infile.close();

}

/**
 * Constructs an AnagramDict from a vector of words.
 * @param words The vector of strings to be used as source words.
 */
AnagramDict::AnagramDict(const vector<string>& words)
{
    /* Your code goes here! */
    for(auto & a: words){
        string word1 = a;
        std::sort(word1.begin(),word1.end());
        dict[word1].push_back(a);
    }
}

/**
 * @param word The word to find anagrams of.
 * @return A vector of strings of anagrams of the given word. Empty
 * vector returned if no anagrams are found or the word is not in the
 * word list.
 */
vector<string> AnagramDict::get_anagrams(const string& word) const
{
    /* Your code goes here! */
    string word1=word;
    std::sort(word1.begin(),word1.end());
    if(dict.find(word1)==dict.end() || word.size() == 1){
        return vector<string>();

    }
    return dict.at(word1);
}

/**
 * @return A vector of vectors of strings. Each inner vector contains
 * the "anagram siblings", i.e. words that are anagrams of one another.
 * NOTE: It is impossible to have one of these vectors have less than
 * two elements, i.e. words with no anagrams are ommitted.
 */
vector<vector<string>> AnagramDict::get_all_anagrams() const
{
    /* Your code goes here! */
    vector<vector<string>> res;
    for(auto & a : dict){
        if(a.second.size()>1){
            res.push_back(a.second);
        }
    }
    return res;
}
