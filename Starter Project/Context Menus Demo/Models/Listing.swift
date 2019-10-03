// Created by Cal Stephens on 10/3/19.
// Copyright © 2019 Airbnb Inc. All rights reserved.

import Foundation
import UIKit

// MARK: - Listing

class Listing {

  let id = UUID().uuidString
  let image: UIImage
  let title: String
  let location: String
  let rating: Double
  let numberOfReviews: Int
  let pricePerNight: Int
  let description: String
  var isFavorite: Bool

  internal init(
    image: UIImage,
    title: String,
    location: String,
    rating: Double,
    numberOfReviews: Int,
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
        title: "Hector Cave House overlooking ocean",
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
        """),

      Listing(
        image: #imageLiteral(resourceName: "airstream"),
        title: "Airstream 'Glamping' in Andalucia!",
        location: "Spain",
        rating: 4.86,
        numberOfReviews: 97,
        pricePerNight: 100,
        description: """
          Offering all the comforts of home with the luxury of a 5 star hotelroom - the airstream is an oasis of luxury in the middle of Nature. Modelled on the original 1930's classic, she's the perfect combination of retro nostalgia and contemporary design. The interior is sleek and stylish, and is equipped with everything you could possibly need to enjoy your glamping experience to the full. Facilities include: fully fitted kitchen with oven/hob/microwave/fridge-freezer; shower room with wc & washbasin; bedroom with cosy double bed; dining area; living area with comfy sofas and flat-screen TV/DVD; i-pod/i-phone docking station, CD player with surround-sound stereo; Wi-Fi internet access; and air con and heating. But perhaps the 'cherry on the cake' is the outdoor plunge pool - the ultimate in glamorous camping!! Laying in the pool or next to it on a warm summer's night as you gaze at the stars is a memory which is sure to remain..
        """),

      Listing(
        image: #imageLiteral(resourceName: "cuba"),
        title: "La Rosa de Ortega / Standard Room",
        location: "Havana",
        rating: 4.93,
        numberOfReviews: 190,
        pricePerNight: 70,
        description: """
          Spacious and comfortable room with four-poster bed, private bath, air conditioning and windows to the street, located on the first floor of our B&B. We offer breakfast, snacks and bar service. All our guests have also access to the swimming pool, gymnasium, free parking, relaxation area and massage center.
      """),

      Listing(
        image: #imageLiteral(resourceName: "yurt"),
        title: "A quiet yurt in Savoie, surrounded by nature",
        location: "Savoie",
        rating: 4.66,
        numberOfReviews: 343,
        pricePerNight: 82,
        description: """
          A Big yurt of 50 m2 in the massif of Wallows in Savoy. Calm down in the middle of nowhere. The view (sight) is 360 ° on baujus mountains (Massif of Bauges). A lot of activities are nearby as trek, mountain bike, climbing and ski. In 30 mn, the lakes of Aix les Bains and Annecy. I know the region perfectly and could advise to you. I let some maps there. The yurt is a circular, good housing environment to get fresh ideas or meditate. A big wood stove warms the atmosphere. It is thus accessible summer and winter alike. In case of snowfall, it will be necessary to finish on foot, in rackets(snowshoes) or in skis according to your tastes. The last part of the way is cleared the snow.
        """),
    ]
  }()

}


