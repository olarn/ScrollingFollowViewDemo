//
//  AccountSummaryWorker.swift
//  TryFollow
//
//  Created by Olarn U. on 31/1/2564 BE.
//

import Foundation

protocol AccountSummaryWorkerProtocol {
    var interactor: AccountSummaryInteractorProtocol? { get set }
    func fetchAccounrSummary()
}

class AccountSummaryWorker: AccountSummaryWorkerProtocol {
    weak var interactor: AccountSummaryInteractorProtocol?
    
    func fetchAccounrSummary() {
        if let interactor = self.interactor {
            interactor.response(accountSummary: ["กรุงเทพฯ", "ภูเก็ต", "เชียงใหม่", "เชียงราย", "ระยอง", "ยะลา", "ปัตตานี", "สงขลา", "กระบี่", "พังงา", "อุดรธานี", "ขอนแก่น", "อุตรดิต", "พิษณุโลก", "แม่ฮ่องสอน", "เชียงราย", "น่าน", "สุพรรณบุรี", "ระนอง", "นราธิวาส", "พัทลุง", "ร้อยเอ็ด", "อุทัยธานี", "ศรีสะเกษ", "นครพนม", "กรุงเทพฯ", "ภูเก็ต", "เชียงใหม่", "เชียงราย", "ระยอง", "ยะลา", "ปัตตานี", "สงขลา", "กระบี่", "พังงา", "อุดรธานี", "ขอนแก่น", "อุตรดิต", "พิษณุโลก", "แม่ฮ่องสอน", "เชียงราย", "น่าน", "สุพรรณบุรี", "ระนอง", "นราธิวาส", "พัทลุง", "ร้อยเอ็ด", "อุทัยธานี", "ศรีสะเกษ", "นครพนม"])
        }
    }
}
