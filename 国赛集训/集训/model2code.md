# c=1

```C++
//1. 首尾相连
#include <bits/stdc++.h>
//# pragma GCC optimize(3)
#define int long long
#define endl "\n"
using namespace std;
const int N=1e3+5;
const int M=1e3+5;
int n,m;
vector<int>car[N];
struct Node{//  站点
    int in,out;//入栈、出站数
}node[N];
struct Order{//订单
    int start ,end;  //起始点
    int id; //订单编号
    bool operator <(const Order &b)const{
        if(start==b.start)return end>b.end;
            return start>b.start;
    }
}order[M];
vector<Order>vec;
priority_queue<Order>que;
vector<Order>S[N];//起点对应订单
int vis[N];
void solve(){
   //文件
    ifstream fin;
    fin.open("data.txt");
    if(!fin.is_open()){
        cout<<"打开失败"<<endl;
        return ;
    }
    fin>>n>>m;
    //cin>>n>>m;
	for(int i=1;i<=m;i++){
		//cin>>order[i].start>>order[i].end;
		fin>>order[i].start>>order[i].end;
        order[i].id=i;
        S[order[i].start].push_back(order[i]);
        que.push(order[i]);
	}
    fin.close();
    sort(order+1,order+1+m);
    for(int i=1;i<=m;i++){//遍历订单
        node[order[i].start].out++;//出站
        node[order[i].end].in++;//入栈
    }
    int cnt=0; 
    //尽量首尾相连，即入站出栈取min相加
    for(int i=1;i<=n;i++){
        cnt+=min(node[i].in,node[i].out);
    }
    int ans=2*m-cnt;
    cout<<"c=1时最小停车次数为"<<ans<<endl;
    //  生成方案
    int idx=0;
    int num=m;
    while(!que.empty()&&num){
        Order u=que.top();
        if(vis[u.id]){
            que.pop();continue;
        }
        num--;
        vis[u.id]=1;
        que.pop();
        S[u.start].pop_back();
        car[++idx].push_back(u.id);
        Order tmp=u;
        while(S[tmp.end].size()){ //有可以相连的
            Order tt=S[tmp.end].back();
            num--;
            vis[tt.id]=1;
            S[tmp.end].pop_back();
            car[idx].push_back(tt.id);
            tmp=tt;
        }
    }
    //output
    cout<<"[";
    for(int i=1;i<=idx;i++){
        cout<<"[ "<<i<<" ";
        for(auto j:car[i]){
            cout<<" "<<j<<" ";
        }
        cout<<"],";
    }
    cout<<"]";
}
signed main() {
  std::ios::sync_with_stdio(false);
  cin.tie(0);
  cout.tie(0);

    freopen("data.out","w",stdout);//
      solve();
  return 0;
}

```

1结果：c=1时最小停车次数为82
[[ 1  33  31 ],[ 2  45  19  40 ],[ 3  26 ],[ 4  5 ],[ 5  38  46  42 ],[ 6  48  50 ],[ 7  49  34 ],[ 8  15 ],[ 9  2  41  36 ],[ 10  27  28 ],[ 11  4 ],[ 12  12  32 ],[ 13  37  30 ],[ 14  21 ],[ 15  47  25 ],[ 16  18  44  43 ],[ 17  35  16 ],[ 18  14  39 ],[ 19  22 ],[ 20  23 ],[ 21  29 ],[ 22  10 ],[ 23  20 ],[ 24  24  17 ],[ 25  3 ],[ 26  8 ],[ 27  1 ],[ 28  6 ],[ 29  11 ],[ 30  13 ],[ 31  9 ],[ 32  7 ],]

2结果：

c=1时最小停车次数为159
[[ 1  38  100  99  97  12 ],[ 2  5  65  77 ],[ 3  36  91 ],[ 4  84 ],[ 5  21 ],[ 6  18 ],[ 7  22 ],[ 8  20  74  56  70 ],[ 9  4  62 ],[ 10  43 ],[ 11  73 ],[ 12  26 ],[ 13  67  42 ],[ 14  10 ],[ 15  95 ],[ 16  51 ],[ 17  32  16  87  93 ],[ 18  66  63  54  2  47 ],[ 19  8 ],[ 20  39  37 ],[ 21  44 ],[ 22  79  75 ],[ 23  1  94  81 ],[ 24  85  59 ],[ 25  78  17 ],[ 26  25 ],[ 27  40 ],[ 28  89 ],[ 29  34  86  68 ],[ 30  15  82  92 ],[ 31  61  76  48 ],[ 32  35  58  69 ],[ 33  71 ],[ 34  45 ],[ 35  33 ],[ 36  72 ],[ 37  83 ],[ 38  30  53 ],[ 39  90 ],[ 40  50 ],[ 41  80 ],[ 42  7 ],[ 43  98  60 ],[ 44  11 ],[ 45  9  57  46 ],[ 46  88 ],[ 47  19 ],[ 48  29 ],[ 49  13 ],[ 50  27 ],[ 51  96 ],[ 52  14  64 ],[ 53  6  31 ],[ 54  52 ],[ 55  49 ],[ 56  28  55 ],[ 57  41  24 ],[ 58  3 ],[ 59  23 ],]

3结果：c=1时最小停车次数为162
[[ 1  34  53  46 ],[ 2  27  81  55 ],[ 3  95 ],[ 4  68 ],[ 5  75  93 ],[ 6  90  33  87 ],[ 7  9  89 ],[ 8  73  77  25  66 ],[ 9  7 ],[ 10  76  91  16  19 ],[ 11  48  6 ],[ 12  18 ],[ 13  80  71  96 ],[ 14  52  67 ],[ 15  21 ],[ 16  65  61 ],[ 17  1  51 ],[ 18  26 ],[ 19  15 ],[ 20  78 ],[ 21  32  50  56 ],[ 22  92 ],[ 23  64  70 ],[ 24  74 ],[ 25  30  86  94 ],[ 26  4  98 ],[ 27  28 ],[ 28  35 ],[ 29  58 ],[ 30  2  69  23 ],[ 31  5 ],[ 32  85 ],[ 33  40 ],[ 34  10 ],[ 35  72 ],[ 36  62 ],[ 37  22 ],[ 38  37  38  100  24 ],[ 39  57  82 ],[ 40  54 ],[ 41  83 ],[ 42  59 ],[ 43  12 ],[ 44  44  49 ],[ 45  60 ],[ 46  29  42 ],[ 47  13  88 ],[ 48  39  31 ],[ 49  41 ],[ 50  79 ],[ 51  14 ],[ 52  3 ],[ 53  20  84 ],[ 54  99 ],[ 55  8  11 ],[ 56  47 ],[ 57  43 ],[ 58  17 ],[ 59  36 ],[ 60  45 ],[ 61  63 ],[ 62  97 ],]

4结果

c=1时最小停车次数为636
[[ 1  298  236  195 ],[ 2  91  384  329  183  29 ],[ 3  398  151  350 ],[ 4  319  36  385  255  263 ],[ 5  10  202 ],[ 6  133  242 ],[ 7  210 ],[ 8  317  362  391 ],[ 9  368  364  44  305  316  377  354 ],[ 10  353  269  388  130  204 ],[ 11  315  311  71 ],[ 12  396  341 ],[ 13  168 ],[ 14  117 ],[ 15  306 ],[ 16  85  375 ],[ 17  330 ],[ 18  157  380  241 ],[ 19  141  321 ],[ 20  386  383 ],[ 21  374  355  201 ],[ 22  63  92  325 ],[ 23  99  343  335  84 ],[ 24  172 ],[ 25  175 ],[ 26  132  392 ],[ 27  25  369 ],[ 28  64  187  69 ],[ 29  171  400 ],[ 30  233  395 ],[ 31  113  372  282 ],[ 32  215  38 ],[ 33  390  56  274 ],[ 34  169  291 ],[ 35  331  152  339 ],[ 36  300  349 ],[ 37  370  357  345  284 ],[ 38  159 ],[ 39  376 ],[ 40  47  387 ],[ 41  28  213 ],[ 42  176  266 ],[ 43  131 ],[ 44  121  365  111 ],[ 45  70  237 ],[ 46  227 ],[ 47  250 ],[ 48  59 ],[ 49  46  212 ],[ 50  290  333  20 ],[ 51  4 ],[ 52  184  281  139  361  256 ],[ 53  41  94  303 ],[ 54  53  379  244 ],[ 55  170  123  322 ],[ 56  352 ],[ 57  257  89 ],[ 58  347 ],[ 59  162  225  62  158 ],[ 60  397  156 ],[ 61  296  54 ],[ 62  389  74 ],[ 63  67  356 ],[ 64  51  189 ],[ 65  116  299 ],[ 66  93 ],[ 67  33 ],[ 68  182 ],[ 69  348 ],[ 70  207 ],[ 71  109 ],[ 72  336  289 ],[ 73  251  373 ],[ 74  218  97 ],[ 75  30  185 ],[ 76  280 ],[ 77  334  359  342 ],[ 78  344  226 ],[ 79  205  246 ],[ 80  153 ],[ 81  340 ],[ 82  295 ],[ 83  37  72 ],[ 84  211  144 ],[ 85  145 ],[ 86  40  346 ],[ 87  12  337  108 ],[ 88  324  135 ],[ 89  80  129 ],[ 90  82 ],[ 91  288  277 ],[ 92  142  248 ],[ 93  285 ],[ 94  272 ],[ 95  55 ],[ 96  232 ],[ 97  2 ],[ 98  154  271 ],[ 99  222  114 ],[ 100  107 ],[ 101  224 ],[ 102  48 ],[ 103  196  24  96 ],[ 104  287  293  394  363 ],[ 105  190  259 ],[ 106  120 ],[ 107  326  77 ],[ 108  261 ],[ 109  57 ],[ 110  371 ],[ 111  393  125 ],[ 112  399  66  240 ],[ 113  318 ],[ 114  98  297 ],[ 115  164 ],[ 116  192  320 ],[ 117  231 ],[ 118  22  221 ],[ 119  174  358  35 ],[ 120  200  351 ],[ 121  309  276 ],[ 122  52 ],[ 123  382 ],[ 124  42 ],[ 125  360 ],[ 126  31  208 ],[ 127  301 ],[ 128  3 ],[ 129  270 ],[ 130  367 ],[ 131  140 ],[ 132  381 ],[ 133  312 ],[ 134  105 ],[ 135  148 ],[ 136  254 ],[ 137  219  58 ],[ 138  45  179  294 ],[ 139  220 ],[ 140  328 ],[ 141  230 ],[ 142  180  115 ],[ 143  23 ],[ 144  60  14 ],[ 145  146 ],[ 146  206  267 ],[ 147  102 ],[ 148  234 ],[ 149  307 ],[ 150  95 ],[ 151  338  217  110 ],[ 152  314 ],[ 153  124 ],[ 154  39  260  100  8 ],[ 155  75  191 ],[ 156  49 ],[ 157  292  229 ],[ 158  143 ],[ 159  32 ],[ 160  65  181  73 ],[ 161  327 ],[ 162  258  310 ],[ 163  86 ],[ 164  194 ],[ 165  150  265 ],[ 166  279 ],[ 167  286  16 ],[ 168  103 ],[ 169  193  186 ],[ 170  34 ],[ 171  268  11 ],[ 172  378  203  308 ],[ 173  9 ],[ 174  15 ],[ 175  5 ],[ 176  165 ],[ 177  283  163 ],[ 178  122 ],[ 179  214 ],[ 180  136 ],[ 181  243  147  167 ],[ 182  323  209  304 ],[ 183  178 ],[ 184  61 ],[ 185  137  68 ],[ 186  177 ],[ 187  119 ],[ 188  126 ],[ 189  253 ],[ 190  78  198 ],[ 191  17 ],[ 192  188  90 ],[ 193  138 ],[ 194  76 ],[ 195  118  79 ],[ 196  104  112 ],[ 197  275 ],[ 198  128 ],[ 199  26 ],[ 200  101 ],[ 201  81  199 ],[ 202  278 ],[ 203  262  252 ],[ 204  273  18 ],[ 205  249 ],[ 206  216 ],[ 207  197 ],[ 208  313 ],[ 209  106 ],[ 210  366 ],[ 211  1 ],[ 212  19 ],[ 213  134  245 ],[ 214  264  235 ],[ 215  88 ],[ 216  239 ],[ 217  149 ],[ 218  160 ],[ 219  238 ],[ 220  27 ],[ 221  13  155 ],[ 222  83 ],[ 223  21 ],[ 224  173  43 ],[ 225  166 ],[ 226  7 ],[ 227  50 ],[ 228  127 ],[ 229  247 ],[ 230  87 ],[ 231  332 ],[ 232  228 ],[ 233  161 ],[ 234  223 ],[ 235  6 ],[ 236  302 ],]

# 3

画线段图，发现起始就是经过次数最多的那段路的次数k+1/2

不可能大于k的，因为不经过所有重复次数为k的线段肯定可以插在空隙中

用线段数优化时间复杂度

计数：区间修改O(mn)-->O(mlogn)   查询 答案logn，总复杂度O(mlogn)



生成方案： 已知最多重复次数k，则相当于有k条长度为n的槽，贪心：将所有订单按起点>终点升序排序，按能放就放的原则插入槽中（遍历k），经验证能够全插入m个订单，

最坏时间复杂度：O(mklogn)~O(m^2logn)

平均：远小于O(mklogn)   （插入时加个随机可能会更快）(反正这个数据量都不到1s)

```cpp
#include <bits/stdc++.h>
//# pragma GCC optimize(3)
// #define int long long
// #define endl "\n"
using namespace std;
//不用 *区间长度
const int N = 1e3 + 5;  //
const int M = 1e3 + 5;
struct Order {     //订单
  int start, end;  //起始点
  int id;          //订单编号
  bool operator<(const Order &b) const {
    if (start == b.start) return end < b.end;
    return start < b.start;
  }
} order[M];
vector<int> car[N];
int vis[N];

struct Seg {
  struct segtreenode {
    int val;
    int lazy;  //懒惰标记
  } segtree[N << 2];
  void pushup(int rt) {
    segtree[rt].val = max(segtree[rt << 1].val, segtree[rt << 1 | 1].val);
  }
  void pushdown(int rt, int ln, int rn) {
    if (segtree[rt].lazy) {                       //有懒惰标记
      segtree[rt << 1].lazy += segtree[rt].lazy;  //更新左右子区间的值和懒惰标记
      segtree[rt << 1 | 1].lazy += segtree[rt].lazy;
      segtree[rt << 1].val += segtree[rt].lazy;  // 最大值不用*
      segtree[rt << 1 | 1].val += segtree[rt].lazy;
      segtree[rt].lazy = 0;  //** 清除标记
    }
  }
  //区间更新
  void updateRange(int L, int R, int l, int r, int c, int rt) {
    if (L <= l && r <= R) {  //
      segtree[rt].val += c;  //更新区间max
      segtree[rt].lazy += c;
      return;
    }
    int mid = (l + r) / 2;
    pushdown(rt, mid - l + 1, r - mid);  //
    if (L <= mid) updateRange(L, R, l, mid, c, rt << 1);
    if (R > mid) updateRange(L, R, mid + 1, r, c, rt << 1 | 1);
    pushup(rt);
  }
  //区间查询 max
  int Rangemax(int L, int R, int l, int r, int rt) {
    if (L <= l && r <= R) return segtree[rt].val;
    if (L > r || R < l) return 0;
    int mid = (l + r) / 2;
    pushdown(rt, mid - l + 1, r - mid);
    return max(Rangemax(L, R, l, mid, rt << 1),
               Rangemax(L, R, mid + 1, r, rt << 1 | 1));
  }
} seg1, seg2[N];

int main() {
  std::ios::sync_with_stdio(false);
  cin.tie(0);
  cout.tie(0);
        freopen("data.out","w",stdout);//
  int m, n;
  // 文件流
  ifstream fin;
  fin.open("data.txt");
  if (!fin.is_open()) {
    cout << "打开失败" << endl;
    return 0;
  }
  // cin>>n>>m;
  fin >> n >> m;
  //线段 l,r-1
  //计数O(mlogn)
  for (int i = 1; i <= m; i++) {  //订单
    int l, r;                     //订单起始点
    // cin>>l>>r; //
    fin >> l >> r;
    order[i].start = l;
    order[i].end = r;
    l++,r++;  //从1开始
    order[i].id = i;
    seg1.updateRange(l, r - 1, 1, n - 1, 1, 1);
  }
  fin.close();
  int ans = seg1.Rangemax(1, n - 1, 1, n - 1, 1) ;
    cout << "最少车辆数为" << (ans +1)/2<< endl;
  //生成方案O(mnlogn)  贪心：按位置排序 从前往后填
  sort(order + 1, order + 1 + m);
  for (int i = 1; i <= m; i++) {
    int l = order[i].start+1;
    int r = order[i].end+1;
    int idx = 1;
    while (seg2[idx].Rangemax(l, r - 1, 1, n - 1, 1)) {  //放不了
      idx++;
    }
    if (idx <= ans) {
      car[idx].push_back(order[i].id);
      seg2[idx].updateRange(l, r - 1, 1, n - 1, 1, 1);
    } else //放不下报错
      cout << "error" << endl;
  }
	int cnt=0;
      //output
    cout<<"[";
for(int i=1;i<=ans;i++){
        if(i%2)cout<<"[ "<<(i+1)/2<<" ";  //2合一
        for(auto j:car[i]){
            cout<<" "<<j<<" ";cnt++;
        }
         if(i%2==0)cout<<"],";
    }
    cout<<"]";
    if(cnt!=m){
        cout<<"error"<<endl;//未全放入报错
    }
}
```

1结果：最少车辆数为16
[[ 1  33  14  39  45  19  40 ],[ 2  26  5 ],[ 3  38  12  41  42  48  50 ],[ 4  49  13  15 ],[ 5  2  20  27  16 ],[ 6  4  37  25 ],[ 7  46  9  21 ],[ 8  47  30  18  24  43 ],[ 9  35  7  31 ],[ 10  22  23 ],[ 11  10  29 ],[ 12  32  44  17 ],[ 13  3  8 ],[ 14  1  11 ],[ 15  6  34 ],[ 16  36  28 ],]

2结果：

最少车辆数为28
[[ 1  38  100  34  86  68  56  70  47  5  65  77 ],[ 2  36  87  55  12  84  2 ],[ 3  21  42  18 ],[ 4  22  20  74  54 ],[ 5  4  16  91  43  17 ],[ 6  73  93  26 ],[ 7  67  10 ],[ 8  95  51 ],[ 9  32  97  66  14  64 ],[ 10  8  24  60  39  3 ],[ 11  44  79  15  82  94  28  37 ],[ 12  1  69  23  85  41 ],[ 13  78  25 ],[ 14  40  89 ],[ 15  61  76  63  99  62 ],[ 16  35  6  31  71 ],[ 17  75  45 ],[ 18  33  72 ],[ 19  83  30  53 ],[ 20  90  29  50 ],[ 21  80  7 ],[ 22  98  11 ],[ 23  9  58  92  88 ],[ 24  19  13 ],[ 25  27  96 ],[ 26  48  57  81 ],[ 27  52  49 ],[ 28  59  46 ],]



3结果：最少车辆数为29
[[ 1  34  33  29  49  91  16  19  27  13  88  82  66 ],[ 2  95  46  84  68 ],[ 3  75  30  86  94  90  2  69  23  98 ],[ 4  9  77  11  73  89 ],[ 5  7  36  76  25 ],[ 6  48  6  18 ],[ 7  80  71  96  52  3  56 ],[ 8  21  65  14  97 ],[ 9  1  31  70  55  26  24 ],[ 10  15  78 ],[ 11  32  50  45  92 ],[ 12  64  63  74 ],[ 13  93  4 ],[ 14  28  35 ],[ 15  58  53 ],[ 16  5  85 ],[ 17  40  10 ],[ 18  72  22 ],[ 19  62  37  38  44  42 ],[ 20  57  54 ],[ 21  83  59 ],[ 22  12  100 ],[ 23  60  87 ],[ 24  81  39  17 ],[ 25  41  79 ],[ 26  61  20 ],[ 27  67  99  51 ],[ 28  8  47 ],[ 29  43 ]，]

4结果：

最少车辆数为104
[[ 1  298  63  92  127  266  183  29  91  65  122  271  38  355  68  274  263 ],[ 2  398  151  79  96  319  36  385  255  204 ],[ 3  10  202  71  133  242 ],[ 4  210  317  47  275  379  90 ],[ 5  368  2  165  291  353  219  58  388  195  158 ],[ 6  315  311  396  24  108 ],[ 7  168  130  117  395 ],[ 8  306  85  372  282  129 ],[ 9  330  157  288  221  189  284 ],[ 10  141  321  44  305  19  152  66  240  386  294  89 ],[ 11  374  289  99  147  260  27  185 ],[ 12  172  54  69  175  377  354 ],[ 13  236  56  132  113  124 ],[ 14  25  254  77  325  322  64  187  247 ],[ 15  171  125  112  297  233  201 ],[ 16  215  186  84  390 ],[ 17  392  169  115 ],[ 18  331  144  332  256  300  349 ],[ 19  370  16  62  159 ],[ 20  376  362  391  135 ],[ 21  28  203  316  74  361  155  176  161 ],[ 22  131  121  184  281  110  50  299 ],[ 23  70  105  95  310  245  227  173  43 ],[ 24  250  59  283  163  123 ],[ 25  46  212  290  387  114 ],[ 26  4  345  41  73  97 ],[ 27  53  213  365  111 ],[ 28  170  235  352  14 ],[ 29  257  347 ],[ 30  162  181  11  20  397  156 ],[ 31  296  198  199  389  166  18 ],[ 32  67  400  51  228  35 ],[ 33  116  93 ],[ 34  33  182 ],[ 35  348  207  7 ],[ 36  109  252  246  336 ],[ 37  251  226  356  218  278  339 ],[ 38  30  342  280 ],[ 39  334  45  179  303  344  78  350 ],[ 40  205  223  244  153  6 ],[ 41  340  295 ],[ 42  37  72  357  211  87 ],[ 43  145  40  104 ],[ 44  12  262  358  302  324  8  229 ],[ 45  80  82 ],[ 46  380  139  208  341  142  238  383 ],[ 47  285  335  272 ],[ 48  55  232 ],[ 49  154  243  343  364  26 ],[ 50  222  107 ],[ 51  224  48 ],[ 52  196  287  293  338  214  273 ],[ 53  190  149  120 ],[ 54  326  261 ],[ 55  57  371  94 ],[ 56  393  399 ],[ 57  318  98 ],[ 58  164  192  320 ],[ 59  231  118  22  277 ],[ 60  174  309  217  241 ],[ 61  200  136  52 ],[ 62  382  42 ],[ 63  360  31 ],[ 64  301  3 ],[ 65  270  367 ],[ 66  140  381 ],[ 67  312  148 ],[ 68  237  369 ],[ 69  269  220 ],[ 70  359  328 ],[ 71  230  180  323  138  101 ],[ 72  23  60 ],[ 73  146  206  209  337 ],[ 74  102  249  234 ],[ 75  307  394  265  167 ],[ 76  314  375 ],[ 77  39  346  75  191 ],[ 78  49  292 ],[ 79  143  32 ],[ 80  327  178  384  134 ],[ 81  258  86 ],[ 82  194  150  363 ],[ 83  279  286 ],[ 84  103  193 ],[ 85  34  268  333 ],[ 86  378  216  9 ],[ 87  15  5 ],[ 88  225  276 ],[ 89  351  61 ],[ 90  137  177 ],[ 91  119  126 ],[ 92  253  17 ],[ 93  188  373 ],[ 94  76  267 ],[ 95  128  81 ],[ 96  304  197 ],[ 97  313  106 ],[ 98  366  1 ],[ 99  264  88 ],[ 100  329  239 ],[ 101  308  160 ],[ 102  259  248 ],[ 103  100  13 ],[ 104  83  21 ],]

问题2

```python
#{贪心结合遗传算法}
import numpy as np
import pandas as pd
import copy as cy
import random as ra
a=pd.read_excel("sji.xlsx","实例4").values
ap=[list(i)[0:2] for i in a]
ap.sort(key=lambda x:x[0])
alst=[]
f=0
i=0
while len(ap)!=0:
   if f==0:
       alst.append([ap[0]])
       f=1
       del ap[0]
       i-=1
   elif alst[-1][-1][1]==ap[i][0]:
       alst[-1].append(ap[i])
       del ap[i]
       i-=1
   if i==len(ap)-1 :
      i=0
      f=0 
   i+=1    
r=alst
ast=[]
if len(r)%2==0:
    for i in range(len(r)//2):
        ast.append([r[i*2],r[i*2+1]])
else:
    for i in range(len(r)//2-1):
        alst.append([r[i*2],r[i*2+1]])
    ast.append([r[len(r)-1],[]])
alst=ast
del r
del ast
def jshu(alst):
    ci=0
    for i in range(len(alst)):
        ls=[]
        for j in range(len(alst[i][0])):
            ls.append(alst[i][0][j][0])
            ls.append(alst[i][0][j][1])
        for j in range(len(alst[i][1])):
            ls.append(alst[i][1][j][0])
            ls.append(alst[i][1][j][1])
        ci+=len(set(ls))
    return ci
def jiaohuan(alst,x,y):
    f=0
    #print(alst)
    lst=alst.copy()
    s,t=ra.randint(0, 1),ra.randint(0, 1)
    if lst[x][s]==lst[y][t]:
        return alst
    for i in range(len(lst[x][s])):
        for j in range(len(lst[y][t])):
            r=ra.random()
            if r<3/4:
                '''
                print(lst)
                print(x)
                print(y)
                print(s)
                print(t)
                print(i)
                print(j)
                '''
                if lst[x][s][i][1]==lst[y][t][j][0]:
                    '''
                    lst[x][s]=pl[x][s][:i+1]
                    print("pl")
                    print(pl)
                    print("xs")
                    print(x,y,s,t,i,j)
                    print(lst)
                    lst[y][t]=pl[y][t][:j]
                    print("yt")
                    print(lst)
                    lst[x][s]+=pl[y][t][j:]
                    print("xs")
                    print(lst)
                    lst[y][t]+=pl[x][s][i+1:]
                    print("换")
                    print(lst)
                    '''
                    lst[x][s][:i+1],lst[x][s][i+1:],lst[y][t][:j],lst[y][t][j:]
                    =lst[x][s][:i+1],lst[y][t][j:],lst[y][t][:j],lst[x][s][i+1:
                    ]
                    f=1
                    break
        if f==1:
            break
    return lst
def hebin(alst):
    r=[]
    for i in range(len(alst)):
        if len(alst[i][1])==0:
            r.append(alst[i][0])
            del alst[i]
        if len(alst[i][0])==0:
            r.append(alst[i][1])
            del alst[i]
    if len(r)%2==0:
        for i in range(len(r)//2):
            alst.append([r[i*2],r[i*2+1]])
    else:
        for i in range(len(r)//2-1):
            alst.append([r[i*2],r[i*2+1]])
        alst.append([r[len(r)-1],[]])
    return alst
def hxhj(a,b):
    a[1],b[0]=b[0],a[1]
    for i in range(len(a[0])):
        for j in range(len(b[0])):
            if a[0][i][0]==b[0][j][1]:
                try:
                    if a[0][i][1]<b[0][j+1][0]:
                        a[0].insert(i+1,b[0][j])
                        del b[0][j]
                except(IndexError):
                    a[0].insert(-1,b[0][j])
                    del b[0][j]
        for j in range(len(b[1])):
            if a[0][i][0]==b[1][j][1]:
                try:
                    if a[0][i][1]<b[1][j+1][0]:
                        a[0].insert(i+1,b[1][j])
                        del b[1][j]
                except(IndexError):
                    a[0].insert(-1,b[1][j])
                    del b[1][j]
    for i in range(len(a[1])):
        for j in range(len(b[0])):
            if a[1][i][0]==b[0][j][1]:
                try:
                    if a[1][i][1]<b[0][j+1][0]:
                        a[1].insert(i+1,b[0][j])
                        del b[0][j]
                except(IndexError):
                    a[1].insert(-1,b[0][j])
                    del b[0][j]
        for j in range(len(b[1])):
            if a[1][i][0]==b[1][j][1]:
                try:
                    if a[1][i][1]<b[1][j+1][0]:
                        a[1].insert(i+1,b[1][j])
                        del b[1][j]
                except(IndexError):
                    a[1].insert(-1,b[1][j])
                    del b[1][j]
    return [a,b]
def dgby(plst):
    f=0
    for i in range(len(plst[0])):
        for j in range(len(plst[1])):
            r=ra.random()
            if r<3/4:
                try:
                    if plst[1][j][1]<plst[0][i][0] and 
                    plst[1][j+1][0]>plst[0][i][1]:
                        plst[1].insert(j,plst[0][i])
                        del plst[0][i]
                        f=1
                        break
                except:
                    pass
        if f==1:
            break
    return plst
def gx(zlst,t):
    for i in range(len(zlst)):
        px=ra.randint(0, len(zlst)-1)
        py=ra.randint(0, len(zlst)-1)
        if py==px:
            py-=1
        pp=zlst.copy()
        pp=jiaohuan(pp,px,py)
        #x,y=ra.randint(0, 1),ra.randint(0, 1)
       #pp[i][x],pp[pz][y]=zlst[i][x].cc(zlst[pz][y])
        p=ra.random()
        rt=ra.random()
        if rt<1/4:
            x,y=ra.randint(0, len(zlst)-1),ra.randint(0, len(zlst)-1)
            if pp[x]!=pp[y]:
                for j in zlst:
                    pass
                    #hxhj(pp[x],pp[y])
        if rt<1/2:
            tm=ra.randint(1, 4)
            for tr in range(tm):
                ii=ra.randint(i, len(zlst)-1)
                pp[ii]=dgby(pp[ii])
        if p<np.exp((-jshu(pp)+jshu(zlst))*t):
            zlst=pp
    return zlst
import ray
@ray.remote
def js(alst,t):
    rtm=ra.randint(1, 3)
    for i in range(rtm):
        alst=gx(alst,t)
        r=ra.random()
        if r<0.6:
            hebin(alst)
    return alst    
tlst=ray.get([js.remote(alst,1) for i in range(30)])
milst=[1000,0]
try:
    import datetime as da
    ti=da.datetime.today()
    for i in range(4000):
        print(i)
        tlst=ray.get([js.remote(tlst[j],i**0.5*ra.random()) for j in range(30)])
        tl=[[jshu(tlst[j]),tlst[j]] for j in range(30)]
        tl.sort(key=lambda x:x[0])
        if tl[0][0]<milst[0]:
            milst=tl[0]
        ti1=da.datetime.today()
        print(ti1-ti)
        print([tl[j][0] for j in range(30)])
        for j in range(len(tlst)):
            r=ra.random()
            if r<0.8:
                tlst[j]=tl[0][1]
            elif r<0.9:
                tlst[j]=tl[1][1]
            elif r<0.97:
                tlst[j]=tl[2][1]
            else:
                tlst[j]=tl[3][1]
    lis=milst[1]
    for i in range(len(lis)):
        print(f"第{i}辆车")
        for j in lis[i][0]:
            print(j,end='')
        for j in lis[i][1]:
            print(j,end='')
        print()
    print(milst[0])
except(KeyboardInterrupt):
    lis=milst[1]
    for i in range(len(lis)):
        print(f"第{i}辆车")
        for j in lis[i][0]:
            print(j,end='')
        for j in lis[i][1]:
            print(j,end='')
        print()
    print(milst[0])

```

