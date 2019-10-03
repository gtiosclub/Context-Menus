// Created by Cal Stephens on 10/3/19.
// Copyright © 2019 Airbnb Inc. All rights reserved.

import Foundation
import UIKit

class ListingCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var reviewsLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!

  func decorate(for listing: Listing) {
    imageView.image = listing.image
    locationLabel.text = listing.location
    ratingLabel.text = "\(listing.rating)"
    reviewsLabel.text = "(\(listing.numberOfReviews))"
    titleLabel.text = listing.title
    priceLabel.text = "$\(listing.pricePerNight)"
  }

}
