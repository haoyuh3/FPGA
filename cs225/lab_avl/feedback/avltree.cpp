/**
 * @file avltree.cpp
 * Definitions of the binary tree functions you'll be writing for this lab.
 * You'll need to modify this file.
 */


template <class K, class V>
V AVLTree<K, V>::find(const K& key) const
{
    return find(root, key);
}

template <class K, class V>
V AVLTree<K, V>::find(Node* subtree, const K& key) const
{
    if (subtree == NULL)
        return V();
    else if (key == subtree->key)
        return subtree->value;
    else {
        if (key < subtree->key)
            return find(subtree->left, key);
        else
            return find(subtree->right, key);
    }
}

template <class K, class V>
void AVLTree<K, V>::rotateLeft(Node*& t)
{
    functionCalls.push_back("rotateLeft"); // Stores the rotation name (don't remove this)
    // your code here
    Node* y=t->right;
    //Node* temp=y->left;
    t->right=y->left;
    y->left=t;
    
    
    // t->height=max(heightOrNeg1(t->left),heightOrNeg1(t->right))+1;
    // t=y;
    // t->height=max(heightOrNeg1(t->left),heightOrNeg1(t->right))+1;
    
    t->height=max(heightOrNeg1(t->left),heightOrNeg1(t->right))+1;
   
    y->height=max(heightOrNeg1(y->left),heightOrNeg1(y->right))+1;
    t=y;
}

template <class K, class V>
void AVLTree<K, V>::rotateLeftRight(Node*& t)
{
    functionCalls.push_back("rotateLeftRight"); // Stores the rotation name (don't remove this)
    // Implemented for you:
    rotateLeft(t->left);
    rotateRight(t);
}

template <class K, class V>
void AVLTree<K, V>::rotateRight(Node*& t)
{
    functionCalls.push_back("rotateRight"); // Stores the rotation name (don't remove this)
    // your code here
    Node* y=t->left;
    t->left=y->right;
    y->right=t;
    
    y->right=t;
    
    t->height=max(heightOrNeg1(t->left),heightOrNeg1(t->right))+1;
    t=y;
    t->height=max(heightOrNeg1(t->left),heightOrNeg1(t->right))+1;
    

}

template <class K, class V>
void AVLTree<K, V>::rotateRightLeft(Node*& t)
{
    functionCalls.push_back("rotateRightLeft"); // Stores the rotation name (don't remove this)
    // your code here
    rotateRight(t->right);
    rotateLeft(t);
}

template <class K, class V>
void AVLTree<K, V>::rebalance(Node*& subtree)
{
    if(subtree==NULL){return;}
    // your code here
    int factor=heightOrNeg1(subtree->right)-heightOrNeg1(subtree->left);
    if(factor==2){
        Node* node_=subtree->right;
        int factor2=heightOrNeg1(node_->right)-heightOrNeg1(node_->left);
        if(factor2>0){
            rotateLeft(subtree);
        }else{
            rotateRightLeft(subtree);
        }
    }
    if(factor==-2){

        Node* node2_=subtree->left;
        int factor3=heightOrNeg1(node2_->right)-heightOrNeg1(node2_->left);
        if(factor3<0){
            rotateRight(subtree);
        }else{
            rotateLeftRight(subtree);
        }
    }
}

template <class K, class V>
void AVLTree<K, V>::insert(const K & key, const V & value)
{
    insert(root, key, value);
}

template <class K, class V>
void AVLTree<K, V>::insert(Node*& subtree, const K& key, const V& value)
{
    // your code here
    if(subtree==NULL){
        Node* new_node=new Node(key, value);
        subtree=new_node;
    }
    else if(key<subtree->key){
        insert(subtree->left,key,value);
        rebalance(subtree);
    }
    else if(key>subtree->key){
        insert(subtree->right,key,value);
        rebalance(subtree);
    }
    else if(key==subtree->key){
        subtree->value=value;
        return;
    }
    subtree->height=max(heightOrNeg1(subtree->right),heightOrNeg1(subtree->left))+1;
    //return;
}

template <class K, class V>
void AVLTree<K, V>::remove(const K& key)
{
    remove(root, key);
}

template <class K, class V>
void AVLTree<K, V>::remove(Node*& subtree, const K& key)
{
    if (subtree == NULL)
        return;

    if (key < subtree->key) {
        // your code here
        remove(subtree->left,key);
        // rebalance(subtree);
    } else if (key > subtree->key) {
        // your code here
        remove(subtree->right,key);
        // rebalence(subtree);
    } else {
        if (subtree->left == NULL && subtree->right == NULL) {
            /* no-child remove */
            // your code here
            delete subtree;
            subtree=NULL;
            return;
        } else if (subtree->left != NULL && subtree->right != NULL) {
            /* two-child remove */
            // your code here
            Node* temp=subtree->left;
            while(temp->right!=NULL){
                temp=temp->right;

            }
            swap(subtree,temp);
            remove(subtree->left,key);


        } else {
            /* one-child remove */
            // your code here
            if(subtree->left!=NULL){
                subtree=subtree->left;
                delete subtree->left;
                subtree->left=NULL;
            }else{
                subtree=subtree->right;
                delete subtree->right;
                subtree->right=NULL;
            }
            
        }
        // your code here

    }
    subtree->height=1+max(heightOrNeg1(subtree->left),heightOrNeg1(subtree->right));
    rebalance(subtree);
    return;
}
