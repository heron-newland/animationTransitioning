//
//  HLLTabBarDelegate.swift
//  HLLTransitioning
//
//  Created by  bochb on 2017/12/8.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLTabBarDelegate: NSObject, UITabBarControllerDelegate {
    
    var interactive = false
    
    /// 系统提供的交互动画类
    var interactiveController = HLLInteractionAnimateTransitionController()
    
    
    /// 指定非交互转场动画管理者
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let fromIndex = tabBarController.viewControllers?.index(of: fromVC)
        let toIndex = tabBarController.viewControllers?.index(of: toVC)
        let direction: HLLTabOperationDirection = fromIndex! > toIndex! ? .left: .right
       let animateTransitionController = HLLAnimateTransitionController()
        animateTransitionController.transitionType = .tabTransition(direction)
        return animateTransitionController
    }
    
    /// 指定交互转场动画管理者
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        //一般直接用系统提供的类, 也可以继承它完成自己的动画
        return interactive && interactiveController.isAnimating ? interactiveController : nil
    }
}
