//
//  LaunchScreenView.swift
//  FinanceApp
//
//  Created by David Penagos on 6/6/19.
//  Copyright © 2019 BlacKow. All rights reserved.
//

import UIKit
import SnapKit

class LaunchScreenView: UIView {
    
    //MARK: - Properties
    private lazy var containerView: UIView = {
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
}

extension LaunchScreenView: ViewConfiguration {
    
    func configureViews() {
        self.backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        self.addSubview(containerView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
