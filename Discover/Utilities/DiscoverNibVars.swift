//
//  DiscoverNibVars.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 14/5/2564 BE.
//

import Foundation

public struct DiscoverNibVars {
    // MARK: - View Controller
    public struct ViewController {
        public static let discover = "DiscoverViewController"
        public static let categories = "CategoriesViewController"
    }
    
    // MARK: - View
    public struct Storyboard {
        public static let discover = "Discover"
        public static let categories = "Categories"
    }
    
    // MARK: - TableViewCell
    public struct TableViewCell {
        public static let greeting = "GreetingTableViewCell"
        public static let wallet = "WalletTableViewCell"
        public static let category = "CategoryTableViewCell"
        public static let suggest = "SuggestTableViewCell"
        public static let partner = "PartnerTableViewCell"
        public static let footer = "FooterTableViewCell"
        public static let ads = "AdsTableViewCell"
    }
    
    // MARK: - CollectionViewCell
    public struct CollectionViewCell {
        public static let category = "CategoryCollectionViewCell"
        public static let suggest = "SuggestCollectionViewCell"
        public static let partner = "PartnerCollectionViewCell"
    }
}
