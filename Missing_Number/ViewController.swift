//
//  ViewController.swift
//  Missing_Number
//
//  Created by mac on 2017/2/18.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aaaaa")
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapBt(sender: UIButton){
        PlayMusic.playEffec()
    }

    @IBAction func returnFromSegue(sender: UIStoryboardSegue){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

