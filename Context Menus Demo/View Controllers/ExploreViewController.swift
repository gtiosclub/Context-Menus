// Created by Cal Stephens on 10/3/19.
// Copyright © 2019 Airbnb Inc. All rights reserved.

import UIKit

class ExploreViewController: UIViewController {

  var listings: [Listing] = Listing.mocks
  @IBOutlet weak var collectionView: UICollectionView!

}

// MARK: ExploreViewController + UICollectionViewDataSource

extension ExploreViewController: UICollectionViewDataSource {

  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int
  {
    return listings.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
  {
    let listing = listings[indexPath.item]

    let listingCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "ListingCollectionViewCell",
      for: indexPath) as! ListingCollectionViewCell

    listingCell.decorate(for: listing)
    return listingCell
  }

}

// MARK: ExploreViewController + UICollectionViewDelegateFlowLayout

extension ExploreViewController: UICollectionViewDelegateFlowLayout {

  var itemsPerRow: Int { 2 }
  var cellAspectRatio: CGFloat { 1.2 }
  var horizontalSpacing: CGFloat { 10 }
  var verticalSpacing: CGFloat { 20 }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize
  {
    let totalWidth = collectionView.bounds.width
    let availableWidth = totalWidth - (CGFloat(2 + (itemsPerRow - 1)) * horizontalSpacing)
    let cellWidth = availableWidth / CGFloat(itemsPerRow)
    return CGSize(width: cellWidth, height: cellWidth * cellAspectRatio)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
  {
    return horizontalSpacing
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat
  {
    return verticalSpacing
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int) -> UIEdgeInsets
  {
    return UIEdgeInsets(
      top: verticalSpacing,
      left: horizontalSpacing,
      bottom: verticalSpacing,
      right: horizontalSpacing)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath)
  {
    let listing = listings[indexPath.item]
    show(ListingDetailsViewController.build(for: listing), sender: nil)
  }

}



