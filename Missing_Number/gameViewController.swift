//
//  gameViewController.swift
//  Missing_Number
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {

    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var gameNumberl: UILabel!
    @IBOutlet weak var gameNumber: UILabel!
    let keyboardCon = keyboardViewController()
    var missingNumber:Int?
    var num:Number!
    var level:Int = 1
    var levelTime:Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        num = Number()
        
        levelLabel.text = "Level \(level)"
    }
    
    override func viewDidAppear(_ animated: Bool) {


    }

    override func viewWillAppear(_ animated: Bool) {
        levelLabel.alpha = 1.0
        gameNumber.alpha = 0.0
        gameNumberl.alpha = 0.0
        var numList = num?.getGameNumbers()
        missingNumber = num?.missingNum
        print(missingNumber!)
        
        if level > 0 && level < 21{
            
            gameNumber.text = "\(numList![0])\(numList![1])\(numList![2])"+"\(numList![3])\(numList![4])\(numList![5])"+"\(numList![6])\(numList![7])\(numList![8])"
            
            switch level {
            case 1...2:
                levelTime = 1
            case 3...4:
                levelTime = 0.8
            case 5...6:
                levelTime = 0.6
            case 7...8:
                levelTime = 0.4
            case 9...10:
                levelTime = 0.2
            default:
                levelTime = 0
            }
            
            gameBegin(levelTime: levelTime, gameLabel: gameNumber)
            
        }else if level > 20 && level < 41{
            
            gameNumberl.text = "\(numList![0])\(numList![1])\(numList![2])"+"\(numList![3])\(numList![4])\(numList![5])"+"\(numList![6])\(numList![7])\(numList![8])"
            
            switch level {
            case 21...22:
                levelTime = 1
            case 23...24:
                levelTime = 0.8
            case 25...26:
                levelTime = 0.6
            case 27...28:
                levelTime = 0.4
            case 29...30:
                levelTime = 0.2
            default:
                levelTime = 0
            }
            
            gameBegin(levelTime: levelTime, gameLabel: gameNumberl)
            
        }else if level > 40 && level < 61{
            
            gameNumber.text = "\(numList![0])\(numList![1])\(numList![2])"+"\(numList![3])\(numList![4])\(numList![5])"+"\(numList![6])\(numList![7])\(numList![8])"
            levelTime = 0
            gameBegin(levelTime: levelTime, gameLabel: gameNumber)
            
        }else if level > 60{
            gameNumberl.text = "\(numList![0])\(numList![1])\(numList![2])"+"\(numList![3])\(numList![4])\(numList![5])"+"\(numList![6])\(numList![7])\(numList![8])"
            levelTime = 0
            gameBegin(levelTime: levelTime, gameLabel: gameNumberl)
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        gameNumber.alpha = 0.0
        levelLabel.alpha = 1.0
        gameNumberl.alpha = 0.0
        level += 1
        levelLabel.text = "Level \(level)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gameBegin(levelTime: Double, gameLabel: UILabel){
        
        print(levelTime)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.levelLabel.alpha = 0.0
        }) { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                gameLabel.alpha = 1.0
            }){ (_) in
                var timer: Timer!
                if #available(iOS 10.0, *) {
                    timer = Timer.scheduledTimer(withTimeInterval: levelTime, repeats: false, block: { (_) in
                        self.performSegue(withIdentifier: "playGame", sender: self)
                    })
                } else {
                    // Fallback on earlier versions
                    
                }
            }
        }
        
        print("a")
        
    }
    
    @IBAction func testTran(_ sender: UIButton) {
        
//        let k = keyboardViewController()
//        
//        self.present(k, animated: true, completion: nil)
        performSegue(withIdentifier: "playGame", sender: self)
    }
    
    @IBAction func returnFromSegue(sender: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playGame"{
            let keyBoardCon = segue.destination as! keyboardViewController
            keyBoardCon.missing = missingNumber
            keyBoardCon.score = level
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
