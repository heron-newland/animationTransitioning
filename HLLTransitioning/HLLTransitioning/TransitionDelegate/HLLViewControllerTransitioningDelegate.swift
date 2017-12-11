//
//  HLLViewControllerTransitioningDelegate.swift
//  HLLTransitioning
//
//  Created by long he on 2017/12/9.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLViewControllerTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        let animatedTransitioning = HLLAnimationManager.manager.animateTransitionController
        animatedTransitioning?.transitionType = .modalTransition(.presentation)
        return animatedTransitioning
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        let animatedTransitioning = HLLAnimationManager.manager.animateTransitionController
        animatedTransitioning?.transitionType = .modalTransition(.dismissal)
        return animatedTransitioning
    }
    
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?{
        
        let interactionAnimatedTransitioning =  HLLAnimationManager.manager.InteractionAnimateTransitionController
        //interactionAnimatedTransitioning?.operation = .dismiss
        
        return (interactionAnimatedTransitioning != nil) && interactionAnimatedTransitioning!.isAnimating ? HLLAnimationManager.manager.InteractionAnimateTransitionController : nil
    }
    
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?{
        
        
        let interactionAnimatedTransitioning =  HLLAnimationManager.manager.InteractionAnimateTransitionController
        interactionAnimatedTransitioning?.operation = .dismiss
        
        return (interactionAnimatedTransitioning != nil) && interactionAnimatedTransitioning!.isAnimating ? HLLAnimationManager.manager.InteractionAnimateTransitionController : nil
    }
    
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?{
        return HLLPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
}
