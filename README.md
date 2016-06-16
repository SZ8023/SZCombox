### SZCombox


下拉列表，下拉列表可以选择显示文字，也可以同时显示文字和图片


![显示图片](https://github.com/SZ8023/SZCombox/screenshot/combox.gif)


---

### 文字模式

如果你只想使用简单的下拉列表，可以这样使用

<pre><code>// 列表需要显示的数据
self.combox.comboxDataArr = @[@"连云港",@"徐州",@"盐城",@"宿迁",@"南京",@"无锡",@"苏州",@"常州",@"南通"];
// 每次需要显示多少行
self.combox.showTableRows = 7;
</code></pre>

### 图片模式

带有图片的下来列表显示也相当简单，你只需要这样做

<pre><code>self.combox.comboxDataArr = @[@"连云港",@"徐州",@"盐城",@"宿迁",@"南京",@"无锡",@"苏州",@"常州",@"南通"];
self.combox.showTableRows = 7;
// 给图片数组赋值，图片数组的大小comboxImgArr与文字数组comboxDataArr的大小要保持相等。
NSMutableArray *imgArr = [NSMutableArray arrayWithCapacity:9];
for (int i = 1; i<10; i++) {
UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"国旗%d",i]];
[imgArr addObject:img];
}
self.combox.comboxImgArr = [imgArr copy];
</code></pre>

### 说明

* 如果下拉列表显示的行数超过了手机屏幕的最底部，会将下拉列表显示在屏幕的中间位置
* 如果SZCombox的父视图是UIScrollView，你可以放心使用，UIScrollView的滑动不会影响下拉列表的使用
