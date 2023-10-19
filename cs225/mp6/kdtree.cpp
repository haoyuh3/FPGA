/**
 * @file kdtree.cpp
 * Implementation of KDTree class.
 */

#include <utility>
#include <algorithm>

using namespace std;

template <int Dim>
bool KDTree<Dim>::smallerDimVal(const Point<Dim>& first,
                                const Point<Dim>& second, int curDim) const
{
    /**
     * @todo Implement this function!
     */
    // bool s;
    if(curDim<0 || curDim>=Dim){return false;}
     if(first[curDim]<second[curDim]){
      return true;
     }
     else if(first[curDim]>second[curDim]){
      return false;
     }
     else{
      return first<second;
     }
     

    // return s;
}

template <int Dim>
bool KDTree<Dim>::shouldReplace(const Point<Dim>& target,
                                const Point<Dim>& currentBest,
                                const Point<Dim>& potential) const
{
    /**
     * @todo Implement this function!
     */
     int d=Dim;
     double cur_d=0;
     double possible_d=0;
     for(int i=0; i<Dim; i++){
      cur_d+=(target[i]-currentBest[i])*(target[i]-currentBest[i]);
      possible_d += (target[i]-potential[i])*(target[i]-potential[i]);
     }
    if(cur_d==possible_d){
      return potential<currentBest;
    }
    return possible_d<cur_d;
}
template<int Dim>
unsigned KDTree<Dim>:: quickselect(vector<Point<Dim>>& list_, int dim, unsigned left, unsigned right, unsigned pivotIndex){
  //swap value and the end of list
  Point<Dim> pivot=list_[pivotIndex];

  Point<Dim> temp=pivot;
  list_[pivotIndex]=list_[right];
  list_[right]=temp;
  
  
  
  //move points less than pivot
  unsigned index=left;
  for(unsigned i=left; i<right;i++){
    if(smallerDimVal(list_[i],pivot, dim)){
      //swap
      temp=list_[index];
      list_[index]=list_[i];
      list_[i]=temp;
      index++;
    }
  }
  //swao pivot index and right
  temp=list_[right];
  list_[right]=list_[index];
  list_[index]=temp;
  //printf("in select1");
  return index;
}

//in quickselect1 we just put value smaller than pivot in one side and the other side is larger than pivot

// use quickselect algoritim to sort the vector
template<int Dim>
Point<Dim>& KDTree<Dim>::quickselect2(vector<Point<Dim>>& list_, int dim, unsigned left, unsigned right, unsigned k){
  //printf("in select2");
  if(left==right){
    return list_[left];
  }
  unsigned pivotIndex=k;
  pivotIndex=quickselect(list_,dim,left,right,pivotIndex);
  //pivot is final
  if(pivotIndex==k){
    return list_[k];
  }
  //compare k to actual pivot
  else if(k<pivotIndex){
    return quickselect2(list_,dim,left,pivotIndex-1,k);
  }
  else{
    return quickselect2(list_,dim,pivotIndex+1,right,k);
  }
}

//helper function
template<int Dim>
//why
typename KDTree<Dim>::KDTreeNode* KDTree<Dim>:: helperfun(vector<Point<Dim>>& list_,int dim, unsigned left, unsigned right){
  if(right>=list_.size()||list_.empty()){
    return NULL;
  }
  if(left>right){
    return NULL;
  }
  unsigned mid=(left+right)/2;
  //find median number
  KDTreeNode* subroot=new KDTreeNode(quickselect2(list_,dim%Dim,left,right,mid));
  size++;
  dim++;
  subroot->left=helperfun(list_,dim,left,mid-1);
  subroot->right=helperfun(list_,dim, mid+1,right);
  return subroot;
}


template <int Dim>
KDTree<Dim>::KDTree(const vector<Point<Dim>>& newPoints)
{
    /**
     * @todo Implement this function!
     */
    size=0;
    vector<Point<Dim>> P;
    P.assign(newPoints.begin(),newPoints.end());
    root=helperfun(P,0,0,P.size()-1);
}

template <int Dim>
KDTree<Dim>::KDTree(const KDTree& other) {
  /**
   * @todo Implement this function!
   */
  //this->root=NULL;
  copy(this->root,other.root);
  size=other.size;
  
} 

template <int Dim>
const KDTree<Dim>& KDTree<Dim>::operator=(const KDTree& rhs) {
  /**
   * @todo Implement this function!
   */
   if(root!=NULL){clear(root);}
   copy(this->root, rhs.root);
   size=rhs.size;
  return *this;
}
template <int Dim>
KDTree<Dim>::KDTree(){
  root=NULL;
  size=0;
}
template <int Dim>
KDTree<Dim>::~KDTree() {
  /**
   * @todo Implement this function!
   */
   clear(root);
}

template <int Dim>
Point<Dim> KDTree<Dim>::findNearestNeighbor(const Point<Dim>& query) const{
  return findNearestNeighbor(root,query,0);
}
template <int Dim>
Point<Dim> KDTree<Dim>::findNearestNeighbor(KDTreeNode* subroot,const Point<Dim>& query,int dim) const
{
    /**
     * @todo Implement this function!
     */
     bool signal;
    Point<Dim> cur=subroot -> point;
    //no children no children
     if(subroot->left==NULL && subroot->right==NULL){return subroot->point;}
    //left
    if(smallerDimVal(query,cur,dim)){
      //left
      if(subroot->left==NULL){cur=findNearestNeighbor(subroot->right,query,(dim+1)%Dim);}
      else{ cur=findNearestNeighbor(subroot->left,query,(dim+1)%Dim);}
      //means should go right in next time
      signal=true;

    }else{
      if(subroot->right==NULL){
        cur=findNearestNeighbor(subroot->left,query,(dim+1)%Dim);
      }else{
        cur=findNearestNeighbor(subroot->right,query,(dim+1)%Dim);
      }
      //go left next time
      signal=false;
      
    }
    
    if(shouldReplace(query,cur,subroot->point)){
      cur=subroot->point;
    }

    //check radius and splitting plane distance within the radius

    double radius=0;
    for(int i=0;i<Dim;i++){
      radius+=(query[i]-cur[i])*(query[i]-cur[i]);
    }
    double split_d=(query[dim]-subroot->point[dim])*(query[dim]-subroot->point[dim]);
    //if split_d is smaller than radius we need to go back to tree 

    if (split_d <= radius) {
		KDTreeNode * direct = signal ? subroot->right : subroot->left;
		if (direct != NULL) {  // If we can traverse other subtree, then traverse
			Point<Dim> otherBest = findNearestNeighbor(direct, query, (dim+ 1) % Dim);
			// Replace currentbest if need be
			if (shouldReplace(query, cur, otherBest)) cur = otherBest;
		}
	}
	  return cur;

}
   







//+++++++++++++++++++++++++++++++++
template<int Dim>
void KDTree<Dim>::copy( KDTreeNode*& subroot, KDTreeNode* other){
  //delete subroot;
  if(other ==NULL)return;
  subroot=new KDTreeNode();
  subroot->point=other->point;
  copy(subroot->left,other->left);
  copy(subroot->right,other->right);
}

template<int Dim>
void KDTree<Dim>::clear(KDTreeNode* node){
  if(node==NULL){return;}
  if(node->left!=NULL){
    clear(node->left);
  }
  if(node->right!=NULL){
    clear(node->right);
  }
  delete node;
  node=NULL;
}

