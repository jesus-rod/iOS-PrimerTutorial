//
//  PrimaryButton.swift
//  PrimerTutorial
//
//  Created by Jesus Rodriguez on 01.06.20.
//  Copyright © 2020 Jesus Rodriguez. All rights reserved.
//

import UIKit

class PrimaryButton: DesignSystemButton {

    public var image: UIImage? {
        didSet {
            setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }

    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let buttonHeight: CGFloat = 60
        let titleInsets = titleEdgeInsets.left + titleEdgeInsets.right
        let imageInsets = imageEdgeInsets.left + imageEdgeInsets.right
        let adjustedWidth = size.width + titleInsets + imageInsets
        return CGSize(width: adjustedWidth, height: buttonHeight)
    }

    override func setup() {
        super.setup()
        clipsToBounds = true
        backgroundColor = Colors.primaryColor
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        titleLabel?.lineBreakMode = .byTruncatingTail
        imageView?.contentMode = .scaleAspectFit
        contentVerticalAlignment = .center
        contentHorizontalAlignment = .center
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

}

class DesignSystemButton: UIButton, DesignSystem {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {}

    private var touchableBounds: CGRect {
        // Para que el area activa del boton sea por lo menos 44x44 (Recomendacion de Apple)
        let widthDelta = bounds.width < DesignConstants.minimumTappableArea.width ? DesignConstants.minimumTappableArea.width - bounds.width : 0
        let heightDelta = bounds.height < DesignConstants.minimumTappableArea.height ? DesignConstants.minimumTappableArea.height - bounds.height : 0
        return bounds.insetBy(dx: -(widthDelta / 2), dy: -(heightDelta / 2))
    }

    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return touchableBounds.contains(point)
    }
}
