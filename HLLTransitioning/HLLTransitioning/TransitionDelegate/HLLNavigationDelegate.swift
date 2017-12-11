//
//  HLLNavigationDelegate.swift
//  HLLTransitioning
//
//  Created by  bochb on 2017/12/8.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLNavigationDelegate: NSObject, UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animatedTransitioning = HLLAnimationManager.manager.animateTransitionController
        animatedTransitioning?.transitionType = .navigationTransition(operation)
        return animatedTransitioning
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
         //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return (HLLAnimationManager.manager.InteractionAnimateTransitionController != nil) && (HLLAnimationManager.manager.InteractionAnimateTransitionController?.isAnimating)! ? HLLAnimationManager.manager.InteractionAnimateTransitionController : nil
    }
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        //绑定
       // let appDelegate = UIApplication.shared.delegate as! AppDelegate
        HLLAnimationManager.manager.InteractionAnimateTransitionController?.bind(to: viewController, with: .pop)
}
}
