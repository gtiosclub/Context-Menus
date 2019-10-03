// Created by Cal Stephens on 10/3/19.
// Copyright © 2019 Airbnb Inc. All rights reserved.

import Foundation
import UIKit

class ListingDetailsViewController: UIViewController {

  var listing: Listing!
  @IBOutlet weak var heroImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!

  static func build(for listing: Listing) -> ListingDetailsViewController {
    let listingDetailsViewController = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(identifier: "ListingDetailsViewController")
      as! ListingDetailsViewController

    listingDetailsViewController.listing = listing
    return listingDetailsViewController
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    heroImageView.image = listing.image
    titleLabel.text = listing.title
    descriptionLabel.text = listing.description
  }

}
