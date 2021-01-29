//
//  Presenter.swift
//  TryFollow
//
//  Created by Olarn U. on 29/1/2564 BE.
//

import Foundation

protocol PresenterPrototype {
    var viewController: ViewControllerProtocol? { get set }
    func showProvince(provinces: [String])
}

class Presenter: PresenterPrototype {
    
    weak var viewController: ViewControllerProtocol?
    
    func showProvince(provinces: [String]) {
        if let vc = viewController {
            vc.showProvince(provinces: provinces)
        }
    }
}
