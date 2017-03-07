//
//  Numbers.swift
//  Missing_Number
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 syi. All rights reserved.
//

import Foundation

class Number{
    
    var missingNum: Int?
    
    func getGameNumbers() -> [Int]{
        
        var numberArray: [Int] = [0,1,2,3,4,5,6,7,8,9]
        missingNum = Int(arc4random() % 10)
        numberArray.remove(at: missingNum!)
        
        for i in 0..<7{
            let index = arc4random() % UInt32(8-i) + UInt32(1 + i)
            let preNum = numberArray[i]
            numberArray[i] = numberArray[Int(index)]
            numberArray[Int(index)] = preNum
        }
    
        return numberArray
    }
    
    func verifyNum(inNum: Int) -> Bool{
        if let num = missingNum{
            if inNum == num{
                return true
            }
        }
        return false
    }
}
