//
//  HotelsEntity.swift
//  TraveLoop
//
//  Created by Ayberk M on 30.09.2022.
//

import Foundation

struct HotelCellViewModel {
    var hotelNameTrans: String?
    var address: String?
    var mainPhotoURL:String?
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Welcome
struct Hotel: Codable {
    let primaryCount, count: Int
    let roomDistribution: [RoomDistribution]
    let mapBoundingBox: MapBoundingBox
    let totalCountWithFilters, unfilteredCount, extendedCount, unfilteredPrimaryCount: Int
    let searchRadius: Int
    let sort: [Sort]
    let result: [Result]

    enum CodingKeys: String, CodingKey {
        case primaryCount = "primary_count"
        case count
        case roomDistribution = "room_distribution"
        case mapBoundingBox = "map_bounding_box"
        case totalCountWithFilters = "total_count_with_filters"
        case unfilteredCount = "unfiltered_count"
        case extendedCount = "extended_count"
        case unfilteredPrimaryCount = "unfiltered_primary_count"
        case searchRadius = "search_radius"
        case sort, result
    }
}

// MARK: - MapBoundingBox
struct MapBoundingBox: Codable {
    let swLat, swLong, neLat, neLong: Double

    enum CodingKeys: String, CodingKey {
        case swLat = "sw_lat"
        case swLong = "sw_long"
        case neLat = "ne_lat"
        case neLong = "ne_long"
    }
}

// MARK: - Result
struct Result: Codable {
    let extended, inBestDistrict: Int
    let reviewRecommendation, zip, cityNameEn: String
    let districtID: Int
    let timezone: String
    let childrenNotAllowed: Int
    let hotelNameTrans: String
    let badges: [Badge]
    let currencycode: Currency
    let isNoPrepaymentBlock: Int
    let type: String
    let checkin: Check
    let reviewNr: Int
    let defaultWishlistName, unitConfigurationLabel: String
    let blockIDS: [String]
    let cc1: String
    let mobileDiscountPercentage, geniusDiscountPercentage, accommodationType, priceIsFinal: Int
    let resultClass, nativeAdsCpc: Int
    let matchingUnitsConfiguration: MatchingUnitsConfiguration
    let hotelIncludeBreakfast: Int
    let nativeAdsTracking: String
    let priceBreakdown: PriceBreakdownClass
    let distance: String
    let ufi, isSmartDeal: Int
    let selectedReviewTopic: JSONNull?
    let distances: [Distance]
    let accommodationTypeName: String
    let classIsEstimated: Int
    let city: String
    let isGeniusDeal: Int
    let bookingHome: BookingHome
    let soldout, isFreeCancellable: Int
    let id: String
    let hasFreeParking: Int
    let reviewScoreWord: String
    let preferred, minTotalPrice, isMobileDeal: Int
    let isGeoRate, nativeAdID, countryTrans, district: String
    let countrycode, districts: String
    let latitude: Double
    let checkout: Check
    let ccRequired: Int
    let hotelFacilities, cityTrans: String
    let mainPhotoID: Int
    let cnRankingContext: CNRankingContext
    let bwallet: Bwallet
    let wishlistCount: Int
    let mainPhotoURL: String
    let hotelName, cityInTrans, distanceToCc: String
    let currencyCode: Currency
    let url: String
    let isCityCenter, cantBook: Int
    let longitude: Double
    let preferredPlus: Int
    let reviewScore: Double
    let hotelID: Int
    let defaultLanguage: String
    let isBeachFront: Int
    let addressTrans: String
    let hotelHasVBBoost: Int
    let address: String
    let compositePriceBreakdown: PriceBreakdown
    let maxPhotoURL, max1440_PhotoURL: String

    enum CodingKeys: String, CodingKey {
        case extended
        case inBestDistrict = "in_best_district"
        case reviewRecommendation = "review_recommendation"
        case zip
        case cityNameEn = "city_name_en"
        case districtID = "district_id"
        case timezone
        case childrenNotAllowed = "children_not_allowed"
        case hotelNameTrans = "hotel_name_trans"
        case badges, currencycode
        case isNoPrepaymentBlock = "is_no_prepayment_block"
        case type, checkin
        case reviewNr = "review_nr"
        case defaultWishlistName = "default_wishlist_name"
        case unitConfigurationLabel = "unit_configuration_label"
        case blockIDS = "block_ids"
        case cc1
        case mobileDiscountPercentage = "mobile_discount_percentage"
        case geniusDiscountPercentage = "genius_discount_percentage"
        case accommodationType = "accommodation_type"
        case priceIsFinal = "price_is_final"
        case resultClass = "class"
        case nativeAdsCpc = "native_ads_cpc"
        case matchingUnitsConfiguration = "matching_units_configuration"
        case hotelIncludeBreakfast = "hotel_include_breakfast"
        case nativeAdsTracking = "native_ads_tracking"
        case priceBreakdown = "price_breakdown"
        case distance, ufi
        case isSmartDeal = "is_smart_deal"
        case selectedReviewTopic = "selected_review_topic"
        case distances
        case accommodationTypeName = "accommodation_type_name"
        case classIsEstimated = "class_is_estimated"
        case city
        case isGeniusDeal = "is_genius_deal"
        case bookingHome = "booking_home"
        case soldout
        case isFreeCancellable = "is_free_cancellable"
        case id
        case hasFreeParking = "has_free_parking"
        case reviewScoreWord = "review_score_word"
        case preferred
        case minTotalPrice = "min_total_price"
        case isMobileDeal = "is_mobile_deal"
        case isGeoRate = "is_geo_rate"
        case nativeAdID = "native_ad_id"
        case countryTrans = "country_trans"
        case district, countrycode, districts, latitude, checkout
        case ccRequired = "cc_required"
        case hotelFacilities = "hotel_facilities"
        case cityTrans = "city_trans"
        case mainPhotoID = "main_photo_id"
        case cnRankingContext = "cn_ranking_context"
        case bwallet
        case wishlistCount = "wishlist_count"
        case mainPhotoURL = "main_photo_url"
        case hotelName = "hotel_name"
        case cityInTrans = "city_in_trans"
        case distanceToCc = "distance_to_cc"
        case currencyCode = "currency_code"
        case url
        case isCityCenter = "is_city_center"
        case cantBook = "cant_book"
        case longitude
        case preferredPlus = "preferred_plus"
        case reviewScore = "review_score"
        case hotelID = "hotel_id"
        case defaultLanguage = "default_language"
        case isBeachFront = "is_beach_front"
        case addressTrans = "address_trans"
        case hotelHasVBBoost = "hotel_has_vb_boost"
        case address
        case compositePriceBreakdown = "composite_price_breakdown"
        case maxPhotoURL = "max_photo_url"
        case max1440_PhotoURL = "max_1440_photo_url"
    }
}

// MARK: - Badge
struct Badge: Codable {
    let id, badgeVariant, text: String

    enum CodingKeys: String, CodingKey {
        case id
        case badgeVariant = "badge_variant"
        case text
    }
}

// MARK: - BookingHome
struct BookingHome: Codable {
    let group: String
    let segment, isBookingHome, qualityClass: Int
    let isSingleUnitProperty: String

    enum CodingKeys: String, CodingKey {
        case group, segment
        case isBookingHome = "is_booking_home"
        case qualityClass = "quality_class"
        case isSingleUnitProperty = "is_single_unit_property"
    }
}

// MARK: - Bwallet
struct Bwallet: Codable {
    let hotelEligibility: Int

    enum CodingKeys: String, CodingKey {
        case hotelEligibility = "hotel_eligibility"
    }
}

// MARK: - Check
struct Check: Codable {
    let from, until: String
}

// MARK: - CNRankingContext
struct CNRankingContext: Codable {
    let etTag, bookCustomGoal, clickCustomGoal: String

    enum CodingKeys: String, CodingKey {
        case etTag = "et_tag"
        case bookCustomGoal = "book_custom_goal"
        case clickCustomGoal = "click_custom_goal"
    }
}

// MARK: - PriceBreakdown
struct PriceBreakdown: Codable {
    let excludedAmount: AllInclusiveAmount
    let productPriceBreakdowns: [PriceBreakdown]?
    let discountedAmount, includedTaxesAndChargesAmount: AllInclusiveAmount
    let items: [Item]
    let strikethroughAmount, grossAmountPerNight, strikethroughAmountPerNight, netAmount: AllInclusiveAmount
    let grossAmountHotelCurrency: AllInclusiveAmount
    let benefits: [Benefit]
    let grossAmount, allInclusiveAmount: AllInclusiveAmount

    enum CodingKeys: String, CodingKey {
        case excludedAmount = "excluded_amount"
        case productPriceBreakdowns = "product_price_breakdowns"
        case discountedAmount = "discounted_amount"
        case includedTaxesAndChargesAmount = "included_taxes_and_charges_amount"
        case items
        case strikethroughAmount = "strikethrough_amount"
        case grossAmountPerNight = "gross_amount_per_night"
        case strikethroughAmountPerNight = "strikethrough_amount_per_night"
        case netAmount = "net_amount"
        case grossAmountHotelCurrency = "gross_amount_hotel_currency"
        case benefits
        case grossAmount = "gross_amount"
        case allInclusiveAmount = "all_inclusive_amount"
    }
}

// MARK: - AllInclusiveAmount
struct AllInclusiveAmount: Codable {
    let currency: Currency
    let value: Double
}

enum Currency: String, Codable {
    case eur = "EUR"
}

// MARK: - Benefit
struct Benefit: Codable {
    let identifier, kind, badgeVariant: String
    let icon: JSONNull?
    let name, details: String

    enum CodingKeys: String, CodingKey {
        case identifier, kind
        case badgeVariant = "badge_variant"
        case icon, name, details
    }
}

// MARK: - Item
struct Item: Codable {
    let details: String
    let base: Base
    let name: String
    let inclusionType: String?
    let itemAmount: AllInclusiveAmount
    let kind: String
    let identifier: String?

    enum CodingKeys: String, CodingKey {
        case details, base, name
        case inclusionType = "inclusion_type"
        case itemAmount = "item_amount"
        case kind, identifier
    }
}

// MARK: - Base
struct Base: Codable {
    let kind: String
    let baseAmount: Double?
    let percentage: Int?

    enum CodingKeys: String, CodingKey {
        case kind
        case baseAmount = "base_amount"
        case percentage
    }
}

// MARK: - Distance
struct Distance: Codable {
    let iconName: String
    let iconSet: JSONNull?
    let text: String

    enum CodingKeys: String, CodingKey {
        case iconName = "icon_name"
        case iconSet = "icon_set"
        case text
    }
}

// MARK: - MatchingUnitsConfiguration
struct MatchingUnitsConfiguration: Codable {
    let matchingUnitsCommonConfig: MatchingUnitsCommonConfig

    enum CodingKeys: String, CodingKey {
        case matchingUnitsCommonConfig = "matching_units_common_config"
    }
}

// MARK: - MatchingUnitsCommonConfig
struct MatchingUnitsCommonConfig: Codable {
    let unitTypeID: Int
    let localizedArea: String

    enum CodingKeys: String, CodingKey {
        case unitTypeID = "unit_type_id"
        case localizedArea = "localized_area"
    }
}

// MARK: - PriceBreakdownClass
struct PriceBreakdownClass: Codable {
    let allInclusivePrice: Int
    let currency: Currency
    let hasTaxExceptions, hasFinePrintCharges: Int
    let sumExcludedRaw: String
    let hasIncalculableCharges: Int
    let grossPrice: String

    enum CodingKeys: String, CodingKey {
        case allInclusivePrice = "all_inclusive_price"
        case currency
        case hasTaxExceptions = "has_tax_exceptions"
        case hasFinePrintCharges = "has_fine_print_charges"
        case sumExcludedRaw = "sum_excluded_raw"
        case hasIncalculableCharges = "has_incalculable_charges"
        case grossPrice = "gross_price"
    }
}

// MARK: - RoomDistribution
struct RoomDistribution: Codable {
    let adults: String
    let children: [Int]
}

// MARK: - Sort
struct Sort: Codable {
    let name, id: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
