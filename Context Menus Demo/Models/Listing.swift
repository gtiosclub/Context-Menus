// Created by Cal Stephens on 10/3/19.
// Copyright © 2019 Airbnb Inc. All rights reserved.

import Foundation
import UIKit

// MARK: - Listing

class Listing {

  let image: UIImage
  let title: String
  let location: String
  let rating: Double
  let numberOfReviews: Double
  let pricePerNight: Int
  let description: String
  var isFavorite: Bool

  internal init(
    image: UIImage,
    title: String,
    location: String,
    rating: Double,
    numberOfReviews: Double,
    pricePerNight: Int,
    description: String)
  {
    self.image = image
    self.title = title
    self.location = location
    self.rating = rating
    self.numberOfReviews = numberOfReviews
    self.pricePerNight = pricePerNight
    self.description = description
    self.isFavorite = false
  }

}

// MARK: - Listing + Mocks

extension Listing {

  static var mocks: [Listing] = {
    return [
      Listing(
        image: #imageLiteral(resourceName: "yurt"),
        title: "A quiet yurt in Savoie - Bauges",
        location: "Bellecombe-en-Bauges",
        rating: 4.66,
        numberOfReviews: 343,
        pricePerNight: 82,
        description: """
          A Big yurt of 50 m2 in the massif of Wallows in Savoy. Calm down in the middle of nowhere. The view (sight) is 360 ° on baujus mountains (Massif of Bauges). A lot of activities are nearby as trek, mountain bike, climbing and ski. In 30 mn, the lakes of Aix les Bains and Annecy. I know the region perfectly and could advise to you. I let some maps there. The yurt is a circular, good housing environment to get fresh ideas or meditate. A big wood stove warms the atmosphere. It is thus accessible summer and winter alike. In case of snowfall, it will be necessary to finish on foot, in rackets(snowshoes) or in skis according to your tastes. The last part of the way is cleared the snow.
        """),

      Listing(
        image: #imageLiteral(resourceName: "porto"),
        title: "PORTA33 I PORTO PENTHOUSE Duplex at Rua das Flores",
        location: "Porto",
        rating: 4.67,
        numberOfReviews: 549,
        pricePerNight: 81,
        description: """
          If want to enjoy the urban vibe of Porto, then this is the ideal place for you. A stunning luxury two-bedroom duplex apartment is located in one of Invicta's best-known streets, Rua das Flores. Since the beginning of the year, the “Quarteirão das Cardosas”, where our space is located, has been the target of several restorations. Although only a few meters from historic sites such as São Bento Station, Aliados Avenue, is in a privileged area for public transport (subway, bus and train).
        """),

      Listing(
        image: #imageLiteral(resourceName: "santorini"),
        title: "Hector Cave House",
        location: "Santorini",
        rating: 4.95,
        numberOfReviews: 257,
        pricePerNight: 432,
        description: """
          The Hector Cave House, carved into the unique caldera cliff for more than 250 years, was originally used as a wine cellar (“the canava”). The traditional “canava” became a family owned summer house, which then opened its doors to share its unique character to travelers from around the world.
        """),

      Listing(
        image: #imageLiteral(resourceName: "san francisco"),
        title: "Cozy, studio garden apartment",
        location: "San Francisco",
        rating: 4.84,
        numberOfReviews: 188,
        pricePerNight: 75,
        description: """
          This lovely, complete, small apartment is a perfect oasis for those wanting a genuine San Francisco experience. This studio includes a private entrance off of garden, main sleeping area, bath, and complete kitchen. The studio is in a diverse, working class residential neighborhood away from City center (5 miles to downtown) and tourist areas but close to a large park, public transportation and major highways making for a great base for exploring opportunities and access to all of the Bay Area.
        """),

      Listing(
        image: #imageLiteral(resourceName: "alaska"),
        title: "Aurora Chalet: private bedroom upstairs loft",
        location: "Fairbanks",
        rating: 4.82,
        numberOfReviews: 182,
        pricePerNight: 47,
        description: """
          Welcome to my Home, that I designed and built in August 2015. No I didn't build it entirely myself, I contracted out many parts, but more than half the work was me. I've been doing airbnb since 2016 when I got to the point of a working finished bathroom. Now that's it is 2019, it's 99% compete! If your party is more than two guests or you want more privacy please contact me via message as I can host more than 2 guests with special arrangements.
        """),

      Listing(
        image: #imageLiteral(resourceName: "hong kong"),
        title: "香港 Hong Kong 長洲 Cheung Chau lsland",
        location: "香港長洲",
        rating: 4.83,
        numberOfReviews: 656,
        pricePerNight: 77,
        description: """
          整個單位330呎 採全開放式,正常可2人睡( 不是和別人供享的 ) 2人後就加$80元1個人 (小朋友同價) 因空間比一般渡假屋大 另可加2張單人摺床或雙人充氣床褥,沙發夠大都足夠睡1人 單位最多5人睡,可供簡單煮食
          (如有寵物每隻額外收取$80元 訂時加人數一位就可) 屋内已有水兜 軟墊和狗廁所提供 來前請咨詢)
        """)
    ]
  }()

}

