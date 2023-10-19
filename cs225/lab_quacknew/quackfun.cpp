/**
 * @file quackfun.cpp
 * This is where you will implement the required functions for the
 *  stacks and queues portion of the lab.
 */

namespace QuackFun {

/**
 * Sums items in a stack.
 * @param s A stack holding values to sum.
 * @return The sum of all the elements in the stack, leaving the original
 *  stack in the same state (unchanged).
 *
 * @note You may modify the stack as long as you restore it to its original
 *  values.
 * @note You may use only two local variables of type T in your function.
 *  Note that this function is templatized on the stack's type, so stacks of
 *  objects overloading the + operator can be summed.
 * @note We are using the Standard Template Library (STL) stack in this
 *  problem. Its pop function works a bit differently from the stack we
 *  built. Try searching for "stl stack" to learn how to use it.
 * @hint Think recursively!
 */
template <typename T>
T sum(stack<T>& s)
{
    // Your code here
    T new_stack;
    //base case
    if(s.empty()){return T();}
    T temp=s.top();
    s.pop();
    new_stack=temp+sum(s);
    s.push(temp);
    return new_stack; // stub return value (0 for primitive types). Change this!
                // Note: T() is the default value for objects, and 0 for
                // primitive types
}

/**
 * Reverses even sized blocks of items in the queue. Blocks start at size
 * one and increase for each subsequent block.
 * @param q A queue of items to be scrambled
 *
 * @note Any "leftover" numbers should be handled as if their block was
 *  complete.
 * @note We are using the Standard Template Library (STL) queue in this
 *  problem. Its pop function works a bit differently from the stack we
 *  built. Try searching for "stl stack" to learn how to use it.
 * @hint You'll want to make a local stack variable.
 */
template <typename T>
void scramble(queue<T>& q)
{
    stack<T> s;
    //queue<T> q2;

    // Your code here
    long unsigned int length=1;
    long unsigned int sum=0;
    int signal=1;
    while(true){
    if(sum+length>q.size()){
        length=q.size()-sum;
        signal=0;
    }
    if(length%2==0){
        for(long unsigned int i=0;i<length;i++){
            //q2=q.front();
            
            s.push(q.front());
            q.pop();
            //printf("1\n");
        }
        for(long unsigned int i=0;i<length;i++){
            //q2=s.top();
           //printf("even\n");
            q.push(s.top());
            //printf("%d\n",s.top());
            s.pop();
            //printf("%d\n",q.back());  
        }

    }else{
        //q2=q.front();
        for(long unsigned int i=0; i<length; i++){
            s.push(q.front());
            q.pop();
            //printf("odd\n");
            //printf("%d\n",s.top());
            q.push(s.top());
            s.pop();
            //printf("%d\n",q.back());
        }
    }
    if(signal==0){return;}
    sum=sum+length;
    length++;
    //printf("%ld", length);
    }
    

}

/**
 * @return true if the parameter stack and queue contain only elements of
 *  exactly the same values in exactly the same order; false, otherwise.
 *
 * @note You may assume the stack and queue contain the same number of items!
 * @note There are restrictions for writing this function.
 * - Your function may not use any loops
 * - In your function you may only declare ONE local boolean variable to use in
 *   your return statement, and you may only declare TWO local variables of
 *   parametrized type T to use however you wish.
 * - No other local variables can be used.
 * - After execution of verifySame, the stack and queue must be unchanged. Be
 *   sure to comment your code VERY well.
 */
template <typename T>
bool verifySame(stack<T>& s, queue<T>& q)
{
    
    bool retval = true; // optional
    T s_temp; // rename me
    T q_temp; // rename :)
    if(s.empty()){return true;}
    s_temp=s.top();
    s.pop();
    retval=verifySame(s,q);
    q_temp=q.front();
    q.pop();
    s.push(s_temp);
    q.push(q_temp);
    retval=(s_temp==q_temp) && retval;
    
    

    return retval;
}

}