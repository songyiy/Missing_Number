//
//  keyboardViewController.swift
//  Missing_Number
//
//  Created by mac on 2017/2/23.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit

class keyboardViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var missing: Int! = nil
    var score: Int!
    let notiName = Notification.Name(rawValue: "UIApplicationDidEnterBackgroundNotification")

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.post(name: notiName, object: nil)
//        NotificationCenter.default.addObserver(forName: notiName, object: nil, queue: nil) { (_) in
//            print("noti")
//            self.performSegue(withIdentifier: "gameOver", sender: self)
//        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardViewController.enterBack), name: notiName, object: nil)
        
        
        
        //print(missing)
        // Do any additional setup after loading the view.
    }
    
    func enterBack(){
        self.performSegue(withIdentifier: "gameOver", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("disappear")
        NotificationCenter.default.removeObserver(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func putNumber(_ sender: UIButton) {
        
        PlayMusic.playEffec()
        
        if let missingNum = missing{
            if sender.tag == missingNum{
                performSegue(withIdentifier: "nextLevel", sender: self)
            }else{
                performSegue(withIdentifier: "gameOver", sender: self)
            }
        }
        
        
//        print(sender.tag)
//        performSegue(withIdentifier: "nextLevel", sender: self)
//        performSegue(withIdentifier: "gameOver", sender: self)
    }

    override func segueForUnwinding(to toViewController: UIViewController, from fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue? {
        if let id = identifier{
            if id == "nextLevel"{
                _ = PlayGameSegue(identifier: id, source: fromViewController, destination: toViewController)
            }
        }
        return super.segueForUnwinding(to: toViewController, from: fromViewController, identifier: identifier)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameOver"{
            let endViewCon = segue.destination as! endViewController
            endViewCon.score = score
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
