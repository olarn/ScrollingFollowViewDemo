//
//  ViewController.swift
//  TryFollow
//
//  Created by Olarn U. on 27/1/2564 BE.
//

import UIKit
 

protocol ViewControllerProtocol: class {
    func showProvince(provinces: [String])
    func present(productGroups: [String])
}

class ViewController: UIViewController {
    
    static var viewController: (UIColor, UITableViewDataSource?, UITableViewDelegate?) -> UIViewController = { color, tableViewDatasource, tableViewDelegate in
        let vc = UIViewController()
        vc.view.backgroundColor = color
        let tableViewController = UITableViewController()
        if let tb = tableViewController.tableView {
            tb.showsVerticalScrollIndicator = false
            tb.frame = vc.view.frame
            tb.dataSource = tableViewDatasource
            tb.delegate = tableViewDelegate
            vc.view.addSubview(tb)
        }
        return vc
    }
    
    var productGroups = [(menuTitle: "", vc: viewController(.clear, nil, nil))]

    let tableViewController = UITableViewController()
    var tableView: UITableView!
    @IBOutlet weak var myAccountLabel: UILabel!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollingFollowView: ScrollingFollowView!
    
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    var interactor: InteractorProtocol = Interactor()
    var presenter: PresenterProtocol = Presenter()
    var worker: WorkerProtocol = Worker()
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIP()
        setupScrollingFollowView()
        setupPagingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fetchAccountSummary()
    }
    
    func setupVIP() {
        interactor.presenter = presenter
        interactor.worker = worker
        worker.interactor = interactor
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

extension ViewController: ViewControllerProtocol {
    
    func showProvince(provinces: [String]) {
        items = provinces
    }
    
    func present(productGroups: [String]) {
        self.productGroups = [
            (menuTitle: "Deposit", vc: ViewController.viewController(.red, self, self)),
            (menuTitle: "Credit Card", vc: ViewController.viewController(.blue, self, self)),
            (menuTitle: "Investment", vc: ViewController.viewController(.yellow, self, self)),
            (menuTitle: "Loan", vc: ViewController.viewController(.blue, self, self)),
            (menuTitle: "Insurance", vc: ViewController.viewController(.yellow, self, self)),
        ]
        menuViewController?.reloadData()
        contentViewController?.reloadData()
    }
}


