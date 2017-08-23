//
//  ViewController.swift
//  TheBasics
//
//  Created by zxjk on 17/8/23.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK:常量和变量
        // 常量 let修饰，不可修改  变量 var修饰 可以修改
        let a = 1
        //a = 2 报错，提示你需要用var修饰； 声明之后没有调用，编译器也会提示
        // 常量和变量可以连续声明
        var b = 10, c = 20
        // 变量可以修改
        b += 10
        c += 10
        
        // MARK:类型标注
        // 在声明变量和常量时，可以在名称后面加 : 再加类型
        let str: NSString = "hello" // 表示可以存储NSString类型的数据
        // 注意：一般来说你很少需要写类型标注。如果你在声明常量或者变量的时候赋了一个初始值，Swift可以推断出这个常量或者变量的类型，这是Swift的类型推测
        
        // MARK: 输出语句
        print(str, a, b, c)
        // 字符串插值
        print("The str is \(str)")
        // 会输出 "The str is hello"
        
        // Swift中的bool值是 true和false
        
        // MARK: 元组 
        // 元组（tuples）把多个值组合成一个复合值。元组内的值可以使任意类型，并不要求是相同类型。
        let http404Error = (404, "Not Found")
        //http404Error 就是一个元组 类型是（Int, String） 元组中的类型可以任意组合
        //你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：
        let (code, msg) = http404Error
        print(code)
        print(msg)
        // 可以只取一部分元组内容
        let (errorCode, _) = http404Error
        // 定义元组时，可以给变量命名，你也可以通过名字或下标来获取
        let address = (province: "ln", city: "sy")
        print(address.0)
        print(address.city)
        //注意：元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。请参考类和结构体。
        
        // MARK: 可选类型
        
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        // 并不是每个字符串都可以转换为Int类型。 字符串"123"可以转换为数值123，但字符串hello，world明显没有数字值可转换为Int。
        // convertedNumber被转换为类型"Int?"，即"可选类型Int"
        // 打印： ▿ Optional<Int> - some : 123 
        // 要么他就是一个Int类型的值，要么就是nil
        
        // 通过赋值nil，你可以将一个可选类型设置为无值状态：
        var number: Int? = 200
        number = nil
        // 注意：nil不能和非可选类型的常量和变量一起使用。 如果你的代码中的常量或变量在某些情况下需要以没有值的状态运行，那你应该始终将其声明为可选类型。
        // 如果你定义了一个可选类型的变量， 但是不设置默认值，那么该变量的值将自动设置为nil： aString为nil
        let aString: String?
        // Swift中的nil不同于OC中的nil。 在OC中，nil 是一个指向不存在的对象的指针。 在Swift中，nil不是指针, 它是一个不存在值的特定类型的。 任何数据类型的可选类型都可以设置为 nil，而不仅仅是对象类型。
        
        // MARK: if语句和强制解包
        if convertedNumber != nil {
            print(convertedNumber!)// 通过if判断可以确定有值，用！来强制解包
        }
        //使用 (!) 时，访问不存在值的可选类型会触发运行错误, 所以在使用(!) 强制解包前, 要始终确保可选类型包含了非空的值。
        
        // MARK: 可选绑定
        if let tempNum = Int(possibleNumber) {
            print(tempNum)
        }else {
            print("无法转换成Int类型")
        }
        // 这段代码可以这样理解：
        // 如果Int(possibleNumber)方法返回的可选Int包含一个值，创建一个名为tempNum的新常量并设置其值为可选类型包含的值。(如果转换成功 tempNum的类型已经是Int)，所以没有必要使用！后缀访问其值。
        
        // MARK: 隐式解包
        let possibleString: String? = "An optional string."
        let forcedString: String = possibleString! // 要求加上!来解包
        
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString: String = assumedString // 不需要加上!也可以解包
        // 你可以将 隐式解包可选类型 看作是给予一个可选类型的权利，在任何它被使用的时候它都能自动解包。 比起在每次使用可选类型时加上一个感叹号时，你只需要在声明它时在其后添加一个感叹号。
        
        // 当一个变量在以后有可能为nil时，不要使用隐式解包可选类型。在变量的生命周期内如果需要检查它是否为nil，请始终使用常规的可选类型。
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

