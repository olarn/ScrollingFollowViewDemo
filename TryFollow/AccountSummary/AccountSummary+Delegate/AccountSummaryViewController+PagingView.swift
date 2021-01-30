//
//  ViewController+PagingView.swift
//  TryFollow
//
//  Created by Olarn U. on 30/1/2564 BE.
//

import Foundation
import PagingKit

//MARK:- Menu View Controller Delegate & Datasource

extension AccountSummaryViewController: PagingMenuViewControllerDataSource {
    
    func setupPagingView() {
        menuViewController.register(
            nib: UINib(nibName: "MenuCell", bundle: nil),
            forCellWithReuseIdentifier: "MenuCell")
        menuViewController.registerFocusView(
            nib: UINib(nibName: "FocusView", bundle: nil),
            isBehindCell: true)
    }
    
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
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
        cell.titleLabel.text = dataSource[index].menuTitle
        return cell
    }
}

extension AccountSummaryViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}

//MARK:- Content View Controller Delegate & Datasource

extension AccountSummaryViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].vc
    }
}

extension AccountSummaryViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
