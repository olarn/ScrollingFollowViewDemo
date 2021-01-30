//
//  ViewController+PagingView.swift
//  TryFollow
//
//  Created by Olarn U. on 30/1/2564 BE.
//

import Foundation
import PagingKit

extension AccountSummaryViewController: PagingMenuViewControllerDataSource {
    
    func setupPagingView() {
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil), isBehindCell: true)
    }
    
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return productGroups.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        switch index {
        case 1: return 120
        case 2: return 120
        case 3: return 90
        case 4: return 110
        default: return 90
        }
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = productGroups[index].menuTitle
        return cell
    }
}

extension AccountSummaryViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        
        tableView.setContentOffset(tableView.contentOffset, animated: false)
        
        // Need to tell scrollFollwingView to prevent it to reset position to zero
        scrollingFollowView.donotResetScrollingPosition()

        contentViewController.scroll(to: page, animated: true)        
    }
}

