//
//  ViewController.swift
//  TryFollow
//
//  Created by Olarn U. on 27/1/2564 BE.
//

import UIKit

protocol ViewControllerProtocol: class {
    func showProvince(provinces: [String])
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollingFollowView: ScrollingFollowView!
    
    var interactor: InteractorProtocol = Interactor()
    var presenter: PresenterPrototype = Presenter()
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIP()
        setupTableView()
        setupScrollingFollowView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fetch()
    }
    
    func setupVIP() {
        interactor.presenter = presenter
        presenter.viewController = self
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: ViewControllerProtocol {
    
    func showProvince(provinces: [String]) {
        items = provinces
        tableView.reloadData()
    }
}
