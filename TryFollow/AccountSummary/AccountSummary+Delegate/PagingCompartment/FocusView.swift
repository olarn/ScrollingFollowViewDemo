//
//  FocusView.swift
//  TryFollow
//
//  Created by Olarn U. on 31/1/2564 BE.
//

import UIKit
import PagingKit

class FocusView: PagingMenuFocusView {

    @IBOutlet weak var backgroundView: UIView!
    
    override func draw(_ rect: CGRect) {
        backgroundView.layer.cornerRadius = 20
    }
}
