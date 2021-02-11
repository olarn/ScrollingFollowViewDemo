//
//  ViewController+ScrollFollowView.swift
//  TryFollow
//
//  Created by Olarn U. on 29/1/2564 BE.
//

import UIKit

extension ViewController: UITableViewDelegate {
    
    func setupScrollingFollowView() {
        let scrollingFollowViewHeight = scrollingFollowView.frame.size.height - 95
        scrollingFollowView.setupDelayPoints(pointOfStartingHiding: 20, pointOfStartingShowing: 20)
        scrollingFollowView.setup(
            constraint: topConstraint,
            maxFollowPoint: scrollingFollowViewHeight,
            minFollowPoint: 0)
        
        scrollingFollowView.onScrolling = {
            self.myAccountLabel.alpha = 1 - abs(self.topConstraint.constant / scrollingFollowViewHeight)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.decelerationRate = .init(rawValue: 0.8)
        scrollingFollowView.didScroll(scrollView, parallaxRatio: 0.6)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollingFollowView.didEndScrolling(decelerate)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollingFollowView.didEndScrolling(true)
    }
}
