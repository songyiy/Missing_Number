//
//  introViewController.swift
//  Missing_Number
//
//  Created by mac on 2017/3/3.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit

class introViewController: UIViewController {
    
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var scoreLable:UILabel!
    @IBOutlet weak var awardimg: UIImageView!
    @IBOutlet var tapReturn: UITapGestureRecognizer!
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapView.backgroundColor = UIColor.clear
        tapReturn.addTarget(self, action: #selector(introViewController.returnToMain))
        tapView.addGestureRecognizer(tapReturn)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let score = userdefault.integer(forKey: "score")
        
        scoreLable.text = "record \(userdefault.integer(forKey: "score"))"
        
        switch score {
        case 0...5:
            awardimg.image = UIImage(named: "I1.png")
        case 6...10:
            awardimg.image = UIImage(named: "L1.png")
        case 11...15:
            awardimg.image = UIImage(named: "O1.png")
        case 16...20:
            awardimg.image = UIImage(named: "V1.png")
        case 21...25:
            awardimg.image = UIImage(named: "E1.png")
        case 26...30:
            awardimg.image = UIImage(named: "U1.png")
        case 31...35:
            awardimg.image = UIImage(named: "D1.png")
        case 36...40:
            awardimg.image = UIImage(named: "W1.png")
        case 41...45:
            awardimg.image = UIImage(named: "Y1.png")
        default:
            awardimg.image = UIImage(named: "Y1.png")
        }
        
    }
    
    func returnToMain(){
        performSegue(withIdentifier: "returnToMain", sender: self)
        PlayMusic.playEffec()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
