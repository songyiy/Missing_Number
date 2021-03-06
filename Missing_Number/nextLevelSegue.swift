//
//  nextLevelSegue.swift
//  Missing_Number
//
//  Created by mac on 2017/2/25.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit

class nextLevelSegue: UIStoryboardSegue {
    override func perform() {
        
        let secondView = self.source.view
        let firstView = self.destination.view
        
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(firstView!, aboveSubview: secondView!)
        
        UIView.animate(withDuration: 1.0, animations: {
            firstView?.frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight)
            secondView?.frame = CGRect(x: 0.0, y: screenHeight, width: screenWidth, height: screenHeight)
        }) { (_) in
            self.source.dismiss(animated: false, completion: nil)
        }
    }
}
