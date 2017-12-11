//
//  HLLPanAnimateTransitionController.swift
//  HLLTransitioning
//
//  Created by long he on 2017/12/9.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLPanAnimateTransitionController: HLLAnimateTransitionController {
    
    /// subscribe your custom animation
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning, containerView: UIView, frowViewController: UIViewController, fromView: UIView, toViewController: UIViewController, toView: UIView) {
        //implement by subclass
        duration = 2
        var translation = containerView.frame.width
        var toViewTransform = CGAffineTransform.identity
        var fromViewTransform = CGAffineTransform.identity
        
        switch transitionType!{
        case .navigationTransition(let operation):
            translation = operation == .push ? translation : -translation
            toViewTransform = CGAffineTransform(translationX: translation, y: 0)
            fromViewTransform = CGAffineTransform(translationX: -translation, y: 0)
        case .tabTransition(let direction):
            translation = direction == .left ? translation : -translation
            fromViewTransform = CGAffineTransform(translationX: translation, y: 0)
            toViewTransform = CGAffineTransform(translationX: -translation, y: 0)
        case .modalTransition(let operation):
            translation =  containerView.frame.height
            toViewTransform = CGAffineTransform(translationX: 0, y: (operation == .presentation ? translation : 0))
            fromViewTransform = CGAffineTransform(translationX: 0, y: (operation == .presentation ? 0 : translation))
        }
        
        switch transitionType! {
        case .modalTransition(let operation):
            switch operation{
            case .presentation: containerView.addSubview(toView)
            case .dismissal: break
            }
        default: containerView.addSubview(toView)
        }
        
        toView.transform = toViewTransform
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.transform = fromViewTransform
            toView.transform = CGAffineTransform.identity
        }, completion: { finished in
            fromView.transform = CGAffineTransform.identity
            toView.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
