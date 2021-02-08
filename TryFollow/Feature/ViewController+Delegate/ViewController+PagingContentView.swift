//
//  AccountSummaryViewController+PagingContentView.swift
//  TryFollow
//
//  Created by Olarn U. on 30/1/2564 BE.
//

import Foundation
import UIKit

extension ViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return productGroups.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return productGroups[index].vc
    }
}

extension ViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        scrollingFollowView.donotResetScrollingPosition()
        menuViewController.scroll(index: index, percent: percent, animated: false)

        // #5. Add code to update overlay (mask)
        
        menuViewController.visibleCells.forEach {
            let cell = $0 as! OverlayMenuCell
            cell.updateMask()
        }
    }
}
