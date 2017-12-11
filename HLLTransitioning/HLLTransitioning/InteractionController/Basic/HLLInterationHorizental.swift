//
//  HLLInterationHorizental.swift
//  HLLTransitioning
//
//  Created by long he on 2017/12/10.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLInterationHorizental: HLLInteractionAnimateTransitionController {
    
    var popRithtToLeft = false
    override func bind(to viewController: UIViewController, with operation: HLLInteractOperation) {
        popRithtToLeft = true
        if (gesture != nil) {
            viewController.view.removeGestureRecognizer(gesture!)
        }
        gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(sender:)))
        viewController.view.addGestureRecognizer(gesture!)
        
    }
    
    @objc func handleGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: sender.view?.superview)
        let vel = sender.velocity(in: sender.view)
        switch sender.state {
        case .began:
            let isRithtToLeft = vel.x < 0
            if operation == .pop {
                if (popRithtToLeft && isRithtToLeft) || (!popRithtToLeft && !isRithtToLeft){
                    viewController?.navigationController?.popViewController(animated: true)
                }
            }else if operation == .tabBar {
                if isRithtToLeft {
                    if (viewController?.tabBarController?.selectedIndex)! < (viewController?.tabBarController?.viewControllers?.count)! - 1 {
                        isAnimating = true
                        viewController?.tabBarController?.selectedIndex += 1
                    }
                }else{
                    if (viewController?.tabBarController?.selectedIndex)! > 0 {
                        isAnimating = true
                        viewController?.tabBarController?.selectedIndex -= 1
                    }
                }
                
            }else{
                isAnimating = true
                viewController?.dismiss(animated: true, completion: nil)
            }
        case .changed:
            if isAnimating {
                var fraction = fabs(translation.x / 200.0)
                fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0))
                shouldCompleteTransition = (fraction > 0.5)
                if fraction >= 1.0 {
                    fraction = 0.99
                }
                self.update(fraction)
            }
        case .cancelled, .ended:
            if isAnimating {
                isAnimating = false
                if !shouldCompleteTransition || gesture?.state == .cancelled {
                    self.cancel()
                } else {
                    self.finish()
                }
            }
        default:
            break
        }
    }
    
    
}

