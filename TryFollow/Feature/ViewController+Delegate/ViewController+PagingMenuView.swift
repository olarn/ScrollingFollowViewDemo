//
//  ViewController+PagingView.swift
//  TryFollow
//
//  Created by Olarn U. on 30/1/2564 BE.
//

import Foundation
import UIKit

extension ViewController: PagingMenuViewControllerDataSource {
    
    func setupPagingView() {
        
        // #1. change register to OverlayMenuCell
        //     and also delete MenuCell and FocusCell.
        
        menuViewController?.register(type: OverlayMenuCell.self, forCellWithReuseIdentifier: "MenuCell")
        menuViewController?.registerFocusView(view: OverlayFocusView(), isBehindCell: true)
        menuViewController?.reloadData(with: 0, completionHandler: { [weak self] (vc) in
            (self?.menuViewController.currentFocusedCell as! OverlayMenuCell)
                .updateMask(animated: false)
        })
    }
    
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return productGroups.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        
        // #2. calculate menu width based-on it's content
        
        return OverlayMenuCell
            .sizingCell
            .calculateWidth(from: viewController.view.bounds.width, title: productGroups[index].menuTitle) + 12
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        
        // #3. configure cell and focus cell style
        
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! OverlayMenuCell
        cell.configure(title: productGroups[index].menuTitle)

        cell.normalTextColor = .white
        cell.hightlightTextColor = .black

        cell.highlightLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.highlightLabel.textAlignment = .center
        cell.titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.titleLabel.textAlignment = .center
        cell.referencedMenuView = viewController.menuView
        cell.referencedFocusView = viewController.focusView
        cell.updateMask()
        return cell
    }
}

extension ViewController: PagingMenuViewControllerDelegate {
    
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        scrollingFollowView.donotResetScrollingPosition()
        contentViewController.scroll(to: page, animated: true)        
    }
    
    // #4. Add more delegate code to activate overlay (updateMask)
    
    func menuViewController(viewController: PagingMenuViewController, willAnimateFocusViewTo index: Int, with coordinator: PagingMenuFocusViewAnimationCoordinator) {
        viewController.visibleCells.compactMap { $0 as? OverlayMenuCell }.forEach { cell in
            cell.updateMask()
        }
        
        coordinator.animateFocusView(alongside: { coordinator in
            viewController.visibleCells.compactMap { $0 as? OverlayMenuCell }.forEach { cell in
                cell.updateMask()
            }
        }, completion: nil)
    }
    
    func menuViewController(viewController: PagingMenuViewController, willDisplay cell: PagingMenuViewCell, forItemAt index: Int) {
        (cell as? OverlayMenuCell)?.updateMask()
    }
}

