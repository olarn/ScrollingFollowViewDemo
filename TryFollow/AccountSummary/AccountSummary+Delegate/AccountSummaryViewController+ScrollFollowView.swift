//
//  ViewController+ScrollFollowView.swift
//  TryFollow
//
//  Created by Olarn U. on 29/1/2564 BE.
//

import UIKit

extension AccountSummaryViewController: UITableViewDelegate {
    
    func setupScrollingFollowView() {
        let scrollingFollowViewHeight = scrollingFollowView.frame.size.height
        scrollingFollowView.setup(
            constraint: topConstraint,
            maxFollowPoint: scrollingFollowViewHeight - 100,
            minFollowPoint: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.decelerationRate = .init(rawValue: 0.7)
        scrollingFollowView.didScroll(scrollView, parallaxRatio: 0.6)
    }
}
