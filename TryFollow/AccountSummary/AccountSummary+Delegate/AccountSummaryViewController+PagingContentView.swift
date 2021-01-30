//
//  AccountSummaryViewController+PagingContentView.swift
//  TryFollow
//
//  Created by Olarn U. on 30/1/2564 BE.
//

import Foundation
import PagingKit

extension AccountSummaryViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return productGroups.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return productGroups[index].vc
    }
}

extension AccountSummaryViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        
        tableView.setContentOffset(tableView.contentOffset, animated: false)
 
        // Need to tell scrollFollwingView to prevent it to reset position to zero
        scrollingFollowView.donotResetScrollingPosition()

        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
