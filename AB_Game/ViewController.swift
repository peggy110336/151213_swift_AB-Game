//
//  ViewController.swift
//  AB_Game
//
//  Created by LIPeggy on 2015/12/13.
//  Copyright © 2015年 LIPeggy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let error_mag = "請輸入四個不重複的數字"
    var ans: [Int] = [1,6,7,2]

    @IBOutlet weak var tf_input: UITextField!
    
    @IBOutlet weak var label_result: UILabel!
    
    @IBAction func btn_guess(sender: UIButton) {
        let input: String? = tf_input.text!
        
        if input == nil {
            label_result.text = error_mag
            return
        }
        var num_array: [Int] = [0,0,0,0]
        if CheckNum(input!,num_array: &num_array) == false{
            return
        }
        for var i = 0; i < 4; i++ {
            print("\(num_array[i])")
        }
        
        
        let result: String = getresult(num_array)
        label_result.text = result
        
    }
    
    func generateAns(){
        for var i=0; i<4; i++ {
            var flag = false
            repeat {
                let randomnum = random()%10
                for var j=0; j<i;j++ {
                    if ans[j] == randomnum {
                        flag = true
                        break;
                    }
                }
            if flag == false {
                ans[i] = randomnum
            }
            }while(flag == true)
        }
    }
    
    func getresult(num_array: [Int])->String{
        var a: Int = 0
        var b: Int = 0
        //這邊有bug！要再修改。1234會變成4b。
        for var i=0; i<4; i++ {
            for var j=0;j<4;j++ {
                if num_array[i] == ans[j] {
                    if i == j {
                        a++
                    }
                    else {
                        b++
                    }
                }
            }
        }
        let result = "\(a)A\(b)B"
        return result
    }
    
    func CheckNum(input: String,inout num_array:[Int]) -> Bool{
        if input.characters.count != 4 {
            label_result.text = "長度必須為4"
            return false
        }
        let number: Int? = Int(input)
        if number == nil {
            label_result.text = error_mag
            return false
        }
        
        num_array[0] = number! / 1000
        num_array[1] = (number! % 1000) / 100
        num_array[2] = ((number! % 1000) % 100) / 10
        num_array[3] = ((number! % 1000) % 100) % 10
        
        var flag = false
        for var i=0; i<4; i++ {
            for var j=0; j<4; j++ {
                if i == j{
                    continue
                }
                if num_array[i] == num_array[j]{
                    flag = true
                    break
                }
            }
        }
        if flag == true {
            label_result.text = error_mag
            return false
        }
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateAns()
        for var i=0; i<4; i++ {
            print("\(i): \(ans[i])")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

