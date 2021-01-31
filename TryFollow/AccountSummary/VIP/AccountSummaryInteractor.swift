//
//  Interactor.swift
//  TryFollow
//
//  Created by Olarn U. on 29/1/2564 BE.
//

import Foundation

protocol AccountSummaryInteractorProtocol: class {
    var presenter: AccountSummaryPresenterProtocol? { get set }
    var worker: AccountSummaryWorkerProtocol? { get set }
    func fetchAccountSummary()
    func response(accountSummary: [String])
}

class AccountSummaryInteractor: AccountSummaryInteractorProtocol {
    
    var presenter: AccountSummaryPresenterProtocol?
    var worker: AccountSummaryWorkerProtocol?
    
    func fetchAccountSummary() {
        if let worker = self.worker {
            worker.fetchAccounrSummary()
        }
    }
    
    func response(accountSummary: [String]) {
        if let presenter = self.presenter {
            presenter.reloadPage(provinces: accountSummary)
        }
    }
}
