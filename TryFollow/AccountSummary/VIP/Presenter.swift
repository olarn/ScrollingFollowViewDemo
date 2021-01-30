//
//  Presenter.swift
//  TryFollow
//
//  Created by Olarn U. on 29/1/2564 BE.
//

import Foundation

protocol PresenterPrototype {
    var viewController: AccountSummaryViewControllerProtocol? { get set }
    func reloadPage(provinces: [String])
}

class Presenter: PresenterPrototype {
    
    weak var viewController: AccountSummaryViewControllerProtocol?
    
    func reloadPage(provinces: [String]) {
        if let vc = viewController {
            vc.showProvince(provinces: provinces)
            
            present(productGroups: ["Deposit", "Credit Card", "Investment", "Loan", "Insurance"])
        }
    }
    
    func present(productGroups: [String]) {
        viewController?.present(productGroups: productGroups)
    }
    

}