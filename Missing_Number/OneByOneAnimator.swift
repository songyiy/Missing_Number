//
//  OneByOneAnimator.swift
//  Missing_Number
//
//  Created by mac on 2017/2/23.
//  Copyright © 2017年 syi. All rights reserved.
//

import UIKit

class OneByOneAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let fromView = fromViewController?.view
        let toView = toViewController?.view
        
        toView?.frame = CGRect(x: (fromView?.frame.minX)!,
                               y: (fromView?.frame.maxY)!,
                               width: (fromView?.frame.width)!,
                               height: (fromView?.frame.height)!)
     
        fromView?.addSubview(toView!)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: transitionDuration, animations: { 
            toView?.frame = transitionContext.finalFrame(for: toViewController!)
        }) { (_) in
            let wasCancel = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(wasCancel)
        }
    }
}
