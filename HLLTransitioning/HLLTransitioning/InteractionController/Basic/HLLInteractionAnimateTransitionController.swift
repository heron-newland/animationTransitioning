//
//  HLLInteractionAnimateTransitionController.swift
//  HLLTransitioning
//
//  Created by  bochb on 2017/12/8.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

/// 交互方式
///
/// - pop:
/// - dismiss:
/// - tabBar:
enum HLLInteractOperation {
    case pop
    case dismiss
    case tabBar
}
class HLLInteractionAnimateTransitionController: UIPercentDrivenInteractiveTransition {

    
    /// 是否正在进行动画
    var isAnimating: Bool = false
    
    
    var shouldCompleteTransition = false
    var viewController: UIViewController?
    var operation: HLLInteractOperation?
    var gesture: UIGestureRecognizer?
    
    /// 将交互控制器和指定的控制器进行绑定
    ///
    /// - Parameters:
    ///   - viewController: 将交互手势添加到此控制器的view中
    ///   - operation: 交互的方法
    public func bind(to viewController: UIViewController, with operation: HLLInteractOperation){
        self.viewController = viewController
        self.operation = operation
        assertionFailure("没有实现具体的交互动画")
    }
   
}
