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
  var horizontalSpacing: CGFloat { 12 }
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

// MARK: ExploreViewController + Context Menus

/// These methods come from `UICollectionViewDelegate`
extension ExploreViewController {

  /// `contextMenuConfigurationForItemAt` is called when the user long-presses one of the `UICollectionView` cells
  /// In this method, you set up your Context Menu.
  func collectionView(
    _ collectionView: UICollectionView,
    contextMenuConfigurationForItemAt indexPath: IndexPath,
    point: CGPoint) -> UIContextMenuConfiguration?
  {
    let listing = listings[indexPath.item]

    /// Use the listing's ID as the identifier for the Context Menu.
    /// We have to cast the ID String to `NSString`, because
    /// the identifier object has to conform to the Objective-C Foundation `NSCopying` protocol.
    return UIContextMenuConfiguration(
      identifier: listing.id as NSString,
      previewProvider: nil,
      actionProvider: { _ in

        /// The `actionProvider` block returns a `UIMenu` with a list of `UIAction`s.
        /// These are the actions available in the Context Menu.

        let favoriteAction: UIAction
        if !listing.isFavorite {
          favoriteAction = UIAction(
            title: "Favorite",
            image: UIImage(systemName: "heart")!,
            handler: { _ in
              listing.isFavorite = true

              // Reload the collection view once the animation finishes
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                collectionView.reloadData()
              })
          })
        } else {
          favoriteAction = UIAction(
            title: "Unfavorite",
            image: UIImage(systemName: "heart.slash.fill")!,
            handler: { _ in
              listing.isFavorite = false

              // Reload the collection view once the animation finishes
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                collectionView.reloadData()
              })
          })
        }

        let shareOption = UIAction(
          title: "Share",
          image: UIImage(systemName: "square.and.arrow.up"),
          handler: { _ in
            let activityViewController = UIActivityViewController(
              activityItems: ["Check out this listing on Airbnb: \(listing.title)"],
              applicationActivities: nil)
            
            self.present(activityViewController, animated: true)
        })

        return UIMenu(
          title: "",
          children: [favoriteAction, shareOption])
    })
  }

  /// `previewForHighlightingContextMenuWithConfiguration` decides
  /// what part of the original view is used as the Context Menu preview
  func collectionView(
    _ collectionView: UICollectionView,
    previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?
  {
    /// Use the `configuration`'s `identifier` to find the corresponding `ListingCollectionViewCell`
    guard let listingID = configuration.identifier as? String,
      let listingIndex = listings.firstIndex(where: { $0.id == listingID }),
      let listingCell = collectionView.cellForItem(at: IndexPath(item: listingIndex, section: 0)) as? ListingCollectionViewCell else
    {
      return nil
    }

    return UITargetedPreview(view: listingCell.imageContainer)
  }

  /// `previewForDismissingContextMenuWithConfiguration` is usually
  /// the same as `previewForHighlightingContextMenuWithConfiguration`
  func collectionView(
    _ collectionView: UICollectionView,
    previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?
  {
    return self.collectionView(collectionView, previewForHighlightingContextMenuWithConfiguration: configuration)
  }

  /// `willPerformPreviewActionForMenu` is called when the user taps on the Context Menu's preview view
  /// Usually this can perform the same action as selecting the collection view cell
  func collectionView(
    _ collectionView: UICollectionView,
    willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration,
    animator: UIContextMenuInteractionCommitAnimating)
  {
    /// Use the `configuration`'s `identifier` to find the corresponding `ListingCollectionViewCell`
    guard let listingID = configuration.identifier as? String,
      let listingIndex = listings.firstIndex(where: { $0.id == listingID }) else
    {
      return
    }

    animator.addCompletion {
      self.collectionView(collectionView, didSelectItemAt: IndexPath(item: listingIndex, section: 0))
    }
  }

}
