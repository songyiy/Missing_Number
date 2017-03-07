//
//  endViewController.swift
//  Missing_Number
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit

class endViewController: UIViewController {
    
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int! = nil
    var scoreDef = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        midView.layer.borderWidth = 1.0
//        midView.layer.borderColor = UIColor.black.cgColor
//        midView.layer.cornerRadius = 16
//        midView.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let scorePre = scoreDef.integer(forKey: "score")
        
        if let levelNum = score{
            scoreLabel.text = "score  \(levelNum-1)\nrecord \(scorePre)"
        }
        
        
        if score - 1 > scorePre{
            
            scoreDef.set(score - 1, forKey: "score")
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapBt(sender: UIButton){
        PlayMusic.playEffec()
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
