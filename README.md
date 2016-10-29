# Swift-Design-Patterns-for-iOS
Describe the book 23 kinds of design patterns base on Swift,The reference to Objective-C Design Patterns.

描述和介绍用Swift实现23种设计模式的书籍，帮助大家提高自己的设计能力，一起巩固和提升Swift语言的知识，欢迎大家给出建议和发布自己的见解。

# 序
在学习Objective-C的过程中，发现对设计模式一窍不通，根本不懂什么叫适配器模式，享元模式等等，但是发现很多编码的时候都会用到。当我发现了Objective-C Design Patterns 这本书书籍以后，如获至宝，里面各种设计模式以及技术分享知识受用至今，无论对现在的开源设计，以及项目架构设计都有极大的帮助。基于兴趣，在这里按照此书的思想，重新塑造一个Swift语言的设计模式，以下设计内容取其精华。
	有兴趣的可以也看下，以下是链接：http://www.ocdesignpatterns.com/
	<img src="/Resource/oc.jpg"  title="book">

# 设计中常见的问题
## 针对接口编程,而不是针对实现编程
### 刚看到这个问题的时候,我也一片茫然,不是很好理解这句话的含义,通过耐心的阅读不难发现作者想表达的意思.
   
### 很多开发人员都了解类,对象,继承,多态和接口的这些面向对象的概念.但类继承与接口继承的区别很少有人能完全掌握其中区别.接口定义了类型,接口继承(子类型化)让我们可以用一个对象代替另一个对象.另一方面,类继承是通过复用父类的功能或者只是简单地共享代码和表述,来定义对象的实现和类型的一种机制.类继承让我们能够现成的类继承所需大部分功能,从而快速定义新的类.其实,类和类型关系非常密切.不过,差别在于对一个对象可以具有多种类型而不同类的对象可以有相同的类型.
   
### 定义具有相同接口的类群很重要,因为多态是基于接口的.其他面向对象的编程语言,如Java,允许开发者定义'接口'(区别于类)类型,它确定了客户端同所用的具体类之间的一种'合约'.像Swift以及Objective-C中有一种类似的叫做协议(protocol).协议也是对象间的一种合约,但本身不能实例化,Swift中协议的作用逐渐的被放大,甚至可以声明所需要的属性.实现协议或者从抽象类继承,使得对象共享相同的接口.因此,子类型的所有对象,都可以对针对协议或抽象类的接口的请求作出应答.
    
### 这样做有一下两点好处:
* 只要对象符合客户端所要求的接口,客户端就不必在意所使用对象的确切类型;
* 客户端只知道定义接口的协议或者抽象类,因为客户端对对象的类一如所知;

## 以上就是书中提到的,针对接口编程,而不是针对实现编程.

###   实际上我们在设计一些类的时候,根据业务的关系,我们必须先整理这些类所代表的含义,以及他们的行为.基于他们类之间共同的行为,如果有不同的表现,我们可以使用协议的方式,让具体的对象去实现.比如我们所在的世界,到处都是生物,其中的一种高级生物就是人类,OK,首先我们定义了一个类叫做Person,那么在现实生活中,人类是抽象类,只要是人类他就一定要是1个头,2只手,2只脚,1个嘴巴,以及每个人不同的基本信息,需要生存的首要前提.
###   设想一下,我们现在来定义一个伪需求,比如人类需要生存,必然一定要吃东西和睡觉,在我们的理解中为了吃东西或者有地方可以睡觉,我们只要有钱就行.那么所有的人类就不得不去赚钱,当然富二代的赚钱方式就是问父母去要(这也算是一种方式),所以每个人的赚钱方式也不同.在Swift中我们可以定义一种人类必须要遵守的协议-Living(生存),协议的内容就是必须要eat和Sleep,以及earnMoney.还有就是一些获取个人基本信息的协议,因为每个人的信息都不同.
   ```Swift
public class Person {
    let hands :Int = 2 // 手
    let feet : Int = 2 // 脚
    let mouth :Int = 1 // 嘴巴
    let head : Int = 1 // 头
}

protocol Info {
    var money :Double { get } //钱
    var age :Int { get } // 年龄
    var sex :String { get } // 性别
    var profession:String { get } // 职业
}
protocol Living {

    func eat() // 吃饭
    
    func sleep() //睡觉
    
    func earnMoney() -> Double // 通过不同方式赚钱
}

class cop:Person,Living,Info{
    var profession: String { return "警察"}
    var sex: String { return "男" }
    var age: Int { return 35 }
    
    var exploit:Int = 0
    var money: Double = 0
    func sleep() {
        guard money >= 150 else {
            print("没钱付房租睡觉")
            return
        }
        money -= 150.0
    }
    func eat() {
        guard money >= 50 else {
            print("没钱吃饭")
            return
        }
        money -= 50.0
        
    }
    /* 抓小偷 ,抓一次功勋+1 */
    func catchThief()  {
        exploit += 1
    }
    /*钱根据功勋发工资提成和基本工资*/
    func earnMoney() -> Double {
        
        return Double( exploit)*1000.0+3000
    }
}
class thief:Person,Living,Info{
    var profession: String { return "小偷"}
    var sex: String { return "男" }
    var age: Int { return 18 }
    var money: Double = 0
    func sleep() {
        guard money >= 50 else {
            print("没钱付房租睡觉")
            return
        }
        money -= 50.0
    }
    func eat() {
        guard money >= 10 else {
            print("没钱吃饭")
            return
        }
        money -= 10.0
        
    }
    /* 小偷偷一次1000元 */
    func steal() -> Double {
        return 1000
    }
    /*钱根据功勋发工资提成和基本工资*/
    func earnMoney() -> Double {
        
        return steal()
    }
}

   ```
   


