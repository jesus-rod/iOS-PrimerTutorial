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

    let networkClient = NetworkClient.shared

    var fetchedPosts: [Post] = [Post]() {
        didSet {
            collectionView.reloadData()
        }
    }

    private lazy var collectionView: UICollectionView = {
        let layout = MagazineLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        return collectionView
    }()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedPosts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? PostCollectionViewCell else { return UICollectionViewCell() }
        let viewModel = PostCollectionViewCell.ViewModel(title: fetchedPosts[indexPath.item].title, subtitle: fetchedPosts[indexPath.item].body, postedBy: fetchedPosts[indexPath.item].postedBy)
        cell.set(viewModel)
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        setupCollectionView()
        let task = networkClient.getLatestPosts { (posts, error) in
            if let error = error {
                // mostrar alerta y decir que hubo un error
            }

            print(posts)
            self.fetchedPosts = posts ?? [Post]()
        }
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
