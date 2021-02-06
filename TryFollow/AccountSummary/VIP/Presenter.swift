//
//  Presenter.swift
//  TryFollow
//
//  Created by Olarn U. on 29/1/2564 BE.
//

import Foundation

protocol PresenterProtocol {
    var viewController: ViewControllerProtocol? { get set }
    func reloadPage(provinces: [String])
}

class Presenter: PresenterProtocol {
    
    weak var viewController: ViewControllerProtocol?
    
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
