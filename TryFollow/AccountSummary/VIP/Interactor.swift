//
//  Interactor.swift
//  TryFollow
//
//  Created by Olarn U. on 29/1/2564 BE.
//

import Foundation

protocol InteractorProtocol: class {
    var presenter: PresenterProtocol? { get set }
    var worker: WorkerProtocol? { get set }
    func fetchAccountSummary()
    func response(accountSummary: [String])
}

class Interactor: InteractorProtocol {
    
    var presenter: PresenterProtocol?
    var worker: WorkerProtocol?
    
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
