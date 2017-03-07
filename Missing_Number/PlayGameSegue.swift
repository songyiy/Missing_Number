//
//  PlayGameSegue.swift
//  Missing_Number
//
//  Created by mac on 2017/2/24.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit

class PlayGameSegue: UIStoryboardSegue {

    override func perform() {
        let firstView = self.source.view
        let secondView = self.destination.view
        
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        
        secondView?.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondView!, aboveSubview: firstView!)
        
        UIView.animate(withDuration: 1.0, animations: {
            firstView?.frame = CGRect(x: 0, y: -screenHeight, width: screenWidth, height: screenHeight)
            secondView?.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        }) { (_) in
            self.source.present(self.destination, animated: false, completion: nil)
        }
        
    }
    
}
