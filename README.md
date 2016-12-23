#JXSecurityKeyboard
> 概述：随机布局的数字键盘

  使用招行密码支付时，看到有安全键盘，简单实现随机数字布局的键盘。

> 关键字：

AutoLayout、Lazy、数组内数字随机排序、Swift 3.0

> 主要思路是：

  1. 构造从0-9的可变数组，对数组进行随机排序
  2. 自定义UIInputView及其附件栏
  3. UIInputView采用AutoLayout自定义12个UIButton
  4. UIButton的对应数字按照可变数组内的放置
  
##数组内数字随机排序
废话不多说，直接上代码，很简单，百度一大把

    //懒加载数字列表
    private lazy var JXNumberMutableArray:NSMutableArray! = {
        var startArray = NSMutableArray(array: [0,1,2,3,4,5,6,7,8,9])
        var resultArray = NSMutableArray()
        for i in 0..<startArray.count {
            let t = arc4random() % UInt32(startArray.count)
            resultArray[i] = startArray[Int(t)]
            startArray[Int(t)] = startArray.lastObject as Any
            startArray.removeLastObject()
        }
        return resultArray
    }()    
采用懒加载是为了节省内存，带来的弊端是初始化一个InputView只能执行一次随机布局。
##懒加载
除了随机数组采用懒加载，还有附件栏标题及完成按钮都是用懒加载。其作用是在第一次使用属性的时候才去生成，而不是在一开始就初始化好，按需使用。当计算属性的值比较耗时，或者需要外部值的依赖时，用lazy比较合适。

    lazy var name: String = {
        // ...
        return ...
    }()    
其中有几个注意点：

* Swift中懒加载需要使用 <font color=red> lazy </font> 关键字
* <font color=red> lazy </font> 关键字必须配合<font color=red> var </font> 关键字使用
* 记得在末尾加上<font color=red> () </font>，表示闭包立即执行

##AutoLayout
来到了大头自动布局，由于键盘跟手机屏幕大小息息相关，当然不能每次都指定按钮的frame，那样会累死人的，所以就必须用到AutoLayout了，至于为什么全部手写，当然是熟能生巧了，多练习练习总没有坏处！当然你也可以使用注明的第三方库：[Masonry](http://masonry.desandro.com/),使用方法还是百度吧。其实我觉得自动布局类似手写一个控件frame以后，剩下的所有控件都跟这个指定frame的控件关联起来，然后牵一发而动全身（当然不可能这么简单啦）。要确定一个控件的位置，你可以直接指定frame的<font color=blue> X、Y、Width、Height </font>四个属性，当使用约束的时候，你就可以通过约束<font color=blue> top、bottom、left、right </font>四个值来确定位置，或者还可以使用<font color=blue> top（bottom）、left（right）、width、height </font>来确定位置，因此一个固定位置的控件，用约束来写可能有很多种写法，算是殊途同归。

    //宽度高度约束
    let widthConstraint1 = NSLayoutConstraint(item: button1, attribute: .width, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.JXInputViewWidth / 3.0)
    let heightConstraint1 = NSLayoutConstraint(item: button1, attribute: .height, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.JXInputViewHeight / 4.0)
    button1.addConstraints([widthConstraint1,heightConstraint1])
    //btn1顶部约束   *
    let topConstraint1 = NSLayoutConstraint(item: button1, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 1.0)
    //btn1距离self左间距  **
    let leftConstraint1 = NSLayoutConstraint(item: button1, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
    
对于button1（正常数字键盘的1键），我们通过约束他的<font color=blue> width、height </font>来确定他的大小，由于这个约束没有参照物，所以约束加在自己身上，确定大小以后就要确定位置，我们通过约束button1的<font color=blue> top、left </font>来确定位置，为了确定位置就不能只管自己，必须和别的View发生关系，这里理所当然就是他的superView(self)了，*的意思就是button1距离顶部(.top)的位置等于(.equal)inputView（self）距离inputView爸爸的顶部(.top)的距离的multiplier(1.0)倍+constant(1.0)的距离。这里要注意的是constant的值<font color=green> > 0 </font>为<font color=red> 往下 </font>和<font color=red> 往左 </font>偏移。

对于button2来说，就需要指定他的top、width、height和距离button1的间距，详见下边：

    let leftMargin2 = NSLayoutConstraint(item: button2, attribute: .left, relatedBy: .equal, toItem: button1, attribute: .right, multiplier: 1.0, constant: 1.0)
    let topConstraint2 = NSLayoutConstraint(item: button2, attribute: .top, relatedBy: .equal, toItem: button1, attribute: .top, multiplier: 1.0, constant: 0.0)
    let widthConstraint2 = NSLayoutConstraint(item: button2, attribute: .width, relatedBy: .equal, toItem: button1, attribute: .width, multiplier: 1.0, constant: 0.0)
    let heightConstraint2 = NSLayoutConstraint(item: button2, attribute: .height, relatedBy: .equal, toItem: button1, attribute: .height, multiplier: 1.0, constant: 0.0)
    
其中leftMargin2就是button2对于button1的间距，宽高和button1一致。

其余button约束类似上述button2的约束，这里需要注意的是，最下边一排按钮需要额外添加距离inputView(self)的bottom的约束。

> 后记：

通过这个小项目主要熟悉代码实现自动布局，并实现键盘输入及位置被遮挡的重新布局。   

>下载[DEMO](https://github.com/JX0829/JXSecurityKeyboard)：
