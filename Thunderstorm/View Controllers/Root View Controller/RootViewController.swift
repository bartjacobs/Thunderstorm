//
//  RootViewController.swift
//  Thunderstorm
//
//  Created by Bart Jacobs on 22/08/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    enum RootViewType: Int {
        case Now = 0
        case Day
        case Week

        static var count: Int {
            return RootViewType.Week.rawValue + 1
        }
    }

    var aspectRatio: CGFloat {
        switch traitCollection.horizontalSizeClass {
        case .compact:
            return 1.0
        default:
            return 1.0 / 3.0
        }
    }

    let minimumInteritemSpacingForSection: CGFloat = 0.0
    let minimumLineSpacingForSection: CGFloat = 0.0
    let insetForSection = UIEdgeInsets()

    @IBOutlet var collectionView: UICollectionView!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Collection View Data Source Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RootViewType.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let type = RootViewType(rawValue: indexPath.item) else {
            return UICollectionViewCell()
        }

        switch type {
        case .Day:
            // Dequeue Reusable Cell
            return collectionView.dequeueReusableCell(withReuseIdentifier: NowCollectionViewCell.ReuseIdentifier, for: indexPath as IndexPath)
        case .Now:
            // Dequeue Reusable Cell
            return collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.ReuseIdentifier, for: indexPath as IndexPath)
        case .Week:
            // Dequeue Reusable Cell
            return collectionView.dequeueReusableCell(withReuseIdentifier: WeekCollectionViewCell.ReuseIdentifier, for: indexPath as IndexPath)
        }
    }

    // MARK: - Collection View Delegate Flow Layout Methods

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds

        return CGSize(width: (bounds.width * aspectRatio), height: bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacingForSection
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacingForSection
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insetForSection
    }

    // MARK: - View Methods

    private func setupView() {
        setupCollectionView()
    }

    // MARK: -

    private func setupCollectionView() {
        collectionView.register(NowCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: NowCollectionViewCell.ReuseIdentifier)
        collectionView.register(DayCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: DayCollectionViewCell.ReuseIdentifier)
        collectionView.register(WeekCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: WeekCollectionViewCell.ReuseIdentifier)
    }

}
