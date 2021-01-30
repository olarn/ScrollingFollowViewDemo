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
            maxFollowPoint: scrollingFollowViewHeight - 110,
            minFollowPoint: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if lastContentOffset > scrollView.contentOffset.y && lastContentOffset < scrollView.contentSize.height - scrollView.frame.height {
            print("scroll down - lastContentOffset = \(lastContentOffset)")
        } else if lastContentOffset < scrollView.contentOffset.y && scrollView.contentOffset.y > 0 {
            print("scroll up - lastContentOffset = \(lastContentOffset)")
        }
        
        lastContentOffset = scrollView.contentOffset.y < 0 ? 0 : scrollView.contentOffset.y
        
        scrollingFollowView.didScroll(scrollView)
    
    }
}
