//
//  TransactionView.swift
//  FinanceApp
//
//  Created by David Penagos on 7/26/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class TransactionView: UIView {

    //MARK: - Properties
    private lazy var viewContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    func setup() {
        
    }
    
}

extension TransactionView: ViewConfiguration {
    
    func configureViews() {
        backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        self.addSubview(viewContainer)
    }
    
    func setupConstraints() {
        viewContainer.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
