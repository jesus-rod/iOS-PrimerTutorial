//
//  MainViewController.swift
//  PrimerTutorial
//
//  Created by Jesus Rodriguez on 05.01.20.
//  Copyright © 2020 Jesus Rodriguez. All rights reserved.
//

import UIKit
import SnapKit
import MagazineLayout

class MainViewController: UIViewController, UICollectionViewDataSource {

    let examplePosts: [PostCollectionViewCell.ViewModel] = [
        PostCollectionViewCell.ViewModel(title: "Busco perro", subtitle: "Tengo ganas de adoptar un perrito", postedBy: "Jesus"),
        PostCollectionViewCell.ViewModel(title: "Busco gato", subtitle: "Tengo ganas de adoptar un gatito", postedBy: "Maria"),
        PostCollectionViewCell.ViewModel(title: "Busco canario", subtitle: "Tengo ganas de adoptar un canarito", postedBy: "Pedro"),
        PostCollectionViewCell.ViewModel(title: "Busco camello", subtitle: "Tengo ganas de adoptar un camellito", postedBy: "Jose")
    ]

    private lazy var collectionView: UICollectionView = {
        let layout = MagazineLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        return collectionView
    }()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return examplePosts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? PostCollectionViewCell else { return UICollectionViewCell() }
        cell.set(examplePosts[indexPath.item])
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        setupCollectionView()
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }


}

extension MainViewController: UICollectionViewDelegateMagazineLayout {

    // tamano de cada objeto
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeModeForItemAt indexPath: IndexPath) -> MagazineLayoutItemSizeMode {
        MagazineLayoutItemSizeMode(widthMode: .fullWidth(respectsHorizontalInsets: true),
                                   heightMode: .dynamic)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForHeaderInSectionAtIndex index: Int) -> MagazineLayoutHeaderVisibilityMode {
        .hidden
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForFooterInSectionAtIndex index: Int) -> MagazineLayoutFooterVisibilityMode {
        .hidden
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, visibilityModeForBackgroundInSectionAtIndex index: Int) -> MagazineLayoutBackgroundVisibilityMode {
        .hidden
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, horizontalSpacingForItemsInSectionAtIndex index: Int) -> CGFloat {
        0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, verticalSpacingForElementsInSectionAtIndex index: Int) -> CGFloat {
        12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetsForSectionAtIndex index: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 60, left: 0, bottom: 30, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetsForItemsInSectionAtIndex index: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }


}
