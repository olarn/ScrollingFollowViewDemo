//
//  Interactor.swift
//  TryFollow
//
//  Created by Olarn U. on 29/1/2564 BE.
//

import Foundation

protocol InteractorProtocol {
    var presenter: PresenterPrototype? { get set }
    func fetch()
}

class Interactor: InteractorProtocol {
    
    var presenter: PresenterPrototype?
    
    func fetch() {
        if let presenter = self.presenter {
            presenter.showProvince(provinces: ["กรุงเทพฯ", "ภูเก็ต", "เชียงใหม่", "เชียงราย", "ระยอง", "ยะลา", "ปัตตานี", "สงขลา", "กระบี่", "พังงา", "อุดรธานี", "ขอนแก่น", "อุตรดิต", "พิษณุโลก", "แม่ฮ่องสอน", "เชียงราย", "น่าน", "สุพรรณบุรี", "ระนอง", "นราธิวาส", "พัทลุง", "ร้อยเอ็ด", "อุทัยธานี", "ศรีสะเกษ", "นครพนม", "กรุงเทพฯ", "ภูเก็ต", "เชียงใหม่", "เชียงราย", "ระยอง", "ยะลา", "ปัตตานี", "สงขลา", "กระบี่", "พังงา", "อุดรธานี", "ขอนแก่น", "อุตรดิต", "พิษณุโลก", "แม่ฮ่องสอน", "เชียงราย", "น่าน", "สุพรรณบุรี", "ระนอง", "นราธิวาส", "พัทลุง", "ร้อยเอ็ด", "อุทัยธานี", "ศรีสะเกษ", "นครพนม"])
        }
    }
}
