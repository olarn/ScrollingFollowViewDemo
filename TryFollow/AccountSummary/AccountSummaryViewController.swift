//
//  ViewController.swift
//  TryFollow
//
//  Created by Olarn U. on 27/1/2564 BE.
//

import UIKit
import PagingKit

protocol AccountSummaryViewControllerProtocol: class {
    func showProvince(provinces: [String])
    func present(productGroups: [String])
}

class AccountSummaryViewController: UIViewController {
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
        let vc = UIViewController()
        vc.view.backgroundColor = color
        return vc
    }
    
    var dataSource = [(menuTitle: "", vc: viewController(.clear))]

    let tableViewController = UITableViewController()
    var tableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollingFollowView: ScrollingFollowView!
    
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    var interactor: InteractorProtocol = Interactor()
    var presenter: PresenterPrototype = Presenter()
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIP()
        setupTableView()
        setupScrollingFollowView()
        setupPagingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fetch()
    }
    
    func setupVIP() {
        interactor.presenter = presenter
        presenter.viewController = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController.dataSource = self
            menuViewController.delegate = self 
        }
        if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController.dataSource = self
            contentViewController.delegate = self 
        }
    }
}

extension AccountSummaryViewController: AccountSummaryViewControllerProtocol {
    
    func showProvince(provinces: [String]) {
        items = provinces
        tableView.reloadData()
    }
    
    func present(productGroups: [String]) {
        dataSource = [
            (menuTitle: "Deposit", vc: AccountSummaryViewController.viewController(.red)),
            (menuTitle: "Credit Card", vc: AccountSummaryViewController.viewController(.blue)),
            (menuTitle: "Investment", vc: AccountSummaryViewController.viewController(.yellow)),
            (menuTitle: "Loan", vc: AccountSummaryViewController.viewController(.blue)),
            (menuTitle: "Insurance", vc: AccountSummaryViewController.viewController(.yellow)),
        ]
        menuViewController.reloadData()
        contentViewController.reloadData()
    }
}


