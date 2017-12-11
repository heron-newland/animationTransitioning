//
//  HLLAnimateTransitionController.swift
//  HLLTransitioning
//
//  Created by  bochb on 2017/12/8.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit
enum HLLTransitionType{
    case navigationTransition(UINavigationControllerOperation)
    case tabTransition(HLLTabOperationDirection)
    case modalTransition(HLLModalOperation)
}

enum HLLTabOperationDirection{
    case left, right
}

enum HLLModalOperation{
    case presentation, dismissal
}

class HLLAnimateTransitionController: NSObject, UIViewControllerAnimatedTransitioning {
    
    //animation duration
    var duration: TimeInterval = 0.3
    //animation direction
    //var reverse: Bool
    
    //var isDismiss: Bool
    
    var transitionType: HLLTransitionType?
//    init(transitionType: HLLTransitionType) {
//        self.duration = 0.3
//        self.transitionType = transitionType
//        //self.reverse = false
//        //self.isDismiss = false
//        super.init()
//    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from), let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        guard let fromView = fromVC.view, let toView = toVC.view else{
            return
        }
        animateTransition(using: transitionContext, containerView:transitionContext.containerView, frowViewController: fromVC, fromView: fromView, toViewController: toVC, toView: toView)
    }
    
    /// subscribe your custom animation
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning, containerView: UIView, frowViewController: UIViewController, fromView: UIView, toViewController: UIViewController, toView: UIView) {
        //implement by subclass
    }
    
}
