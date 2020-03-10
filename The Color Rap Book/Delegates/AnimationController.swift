//
//  AnimationController.swift
//  The Color Rap Book
//
//  Created by 7744 on 2/20/20.
//  Copyright © 2020 7744. All rights reserved.
//

import Foundation
import UIKit

class TransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(transitionType: .presenting)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(transitionType: .dismissing)
    }
}

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    enum TransitionType {
        case presenting
        case dismissing
    }

    var animationTransitionOptions: UIView.AnimationOptions

    init(transitionType: TransitionType) {
        switch transitionType {
        case .presenting:
            animationTransitionOptions = .transitionFlipFromBottom
        case .dismissing:
            animationTransitionOptions = .transitionFlipFromTop
        }

        super.init()
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //let inView   = transitionContext.containerView
        let toView   = transitionContext.viewController(forKey: .to)?.view
        let fromView = transitionContext.viewController(forKey: .from)?.view

        UIView.transition(from: fromView!, to: toView!, duration: transitionDuration(using: transitionContext), options: animationTransitionOptions.union(.curveEaseInOut)) { finished in
            transitionContext.completeTransition(true)
        }
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
}
