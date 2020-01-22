//
//  Labels.swift
//  PrimerTutorial
//
//  Created by Jesus Rodriguez on 15.01.20.
//  Copyright © 2020 Jesus Rodriguez. All rights reserved.
//

import UIKit

class PrimaryLabel: DesignSystemLabel {
    override func setup() {
        font = UIFont.boldSystemFont(ofSize: 16)
    }
}

class SecondaryLabel: DesignSystemLabel {
    override func setup() {
        font = UIFont.systemFont(ofSize: 14)
    }
}

class SmallLabel: DesignSystemLabel {
    override func setup() {
        font = UIFont.italicSystemFont(ofSize: 10)
    }
}

class DesignSystemLabel: UILabel, DesignSystem {

    func setup() {}

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

}

