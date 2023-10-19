class Solution {
public:
    vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {
        vector<int> ans;
        unordered_map<int, int> hash;
        for (auto &i : nums1) ++hash[i];
        for (auto &i : nums2) {
            if (hash.find(i) != hash.end()) {
                ans.emplace_back(i);
                --hash[i];
                if (hash[i] == 0) hash.erase(i);
            }
        }
        return ans;
    }
};



class Solution {
public:
    vector<int> majorityElement(vector<int>& nums) {
        int n = nums.size();
        vector<int> ans;
        unordered_map<int, int> cnt;

        for (auto & v : nums) {
            cnt[v]++;
        }
        for (auto & v : cnt) {
            if (v.second > n / 3) {
                ans.push_back(v.first);
            }
        }

        return ans;
    }
};

class Solution {
    unordered_map<int, int> cnt;
    int maxCnt = 0;

    int dfs(TreeNode *node) {
        if (node == nullptr) {
            return 0;
        }
        int sum = node->val + dfs(node->left) + dfs(node->right);
        maxCnt = max(maxCnt, ++cnt[sum]);
        return sum;
    }

public:
    vector<int> findFrequentTreeSum(TreeNode *root) {
        dfs(root);
        vector<int> ans;
        for (auto &[s, c]: cnt) {
            if (c == maxCnt) {
                ans.emplace_back(s);
            }
        }
        return ans;
    }
};





void insert(int a)
{
    int i;
    for (i = 0;i < si;i++)
    {
        if (num[(a + i*i) % si] == -1)
        {
            num[(a + i*i) % si] = a;
            break;
        }
    }
    if (i == si)
        printf("%d cannot be inserted.\n", a);
}

int find(int a)
{
    int i,all = 0;
    for (i = 0;i <= si;i++)  //按道理不应该有等号，但是不知道为啥这个题这样
    {
        all++;
        if (num[(a + i*i) % si] == a|| num[(a + i*i) % si] == -1)   //如果为空也停止查找
            break;
    }
    return all;
}


int main(){
    cin>>t>>n>>m;
    for(int i=0;i<n;i++){//读入输入序列
        cin>>a[i];
    }
    for(int i=0;i<m;i++){//读入查找序列
        cin>>b[i];
    }
    while(!isprime(t)){
        t++;
    }
    for(int i=0;i<n;i++){
        bool flag=false;
        for (int j=0;j<t;j++) {//将元素插入表中
            int pos=(a[i]+j*j)%t;
            if (hs[pos]==0){
                hs[pos]=a[i];
                flag=true;
                break;
            }
if(table[idx]!=NULL){
        while(1){
            int i=1;
            if(table[(hash(key,size)+i*i)%getdtablesize()]==NULL){
                idx=(hash(key,size)+i*i)%getdtablesize();
                break;
            }
            if(table[(hash(key,size)-i*i)%getdtablesize()]==NULL){
                idx=(hash(key,size)-i*i)%getdtablesize();
                break;
            }
            
            i++;
        }
    }

