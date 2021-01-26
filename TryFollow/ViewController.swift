//
//  ViewController.swift
//  TryFollow
//
//  Created by Olarn U. on 27/1/2564 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollingFollowView: ScrollingFollowView!
    
    let items = ["กรุงเทพฯ", "ภูเก็ต", "เชียงใหม่", "เชียงราย", "ระยอง", "ยะลา", "ปัตตานี", "สงขลา", "กระบี่", "พังงา", "อุดรธานี", "ขอนแก่น", "อุตรดิต", "พิษณุโลก", "แม่ฮ่องสอน", "เชียงราย", "น่าน", "สุพรรณบุรี", "ระนอง", "นราธิวาส", "พัทลุง", "ร้อยเอ็ด", "อุทัยธานี", "ศรีสะเกษ", "นครพนม", "กรุงเทพฯ", "ภูเก็ต", "เชียงใหม่", "เชียงราย", "ระยอง", "ยะลา", "ปัตตานี", "สงขลา", "กระบี่", "พังงา", "อุดรธานี", "ขอนแก่น", "อุตรดิต", "พิษณุโลก", "แม่ฮ่องสอน", "เชียงราย", "น่าน", "สุพรรณบุรี", "ระนอง", "นราธิวาส", "พัทลุง", "ร้อยเอ็ด", "อุทัยธานี", "ศรีสะเกษ", "นครพนม"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupScrollingFollowView()
    }
    
    func setupScrollingFollowView() {
        let scrollingFollowViewHeight = scrollingFollowView.frame.size.height
        scrollingFollowView.setup(
            constraint: topConstraint,
            maxFollowPoint: scrollingFollowViewHeight,
            minFollowPoint: 0)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "cell") ??
            UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollingFollowView.didScroll(scrollView)
    }
}
