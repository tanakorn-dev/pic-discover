//
//  DiscoverViewModel.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 13/5/2564 BE.
//

import Foundation
import UseCase

protocol DiscoverViewModelProtocol: DiscoverViewModelInput, DiscoverViewModelOutput {
    var input: DiscoverViewModelInput { get }
    var output: DiscoverViewModelOutput { get }
}

protocol DiscoverViewModelInput {
    func getDiscoverShelf()
}

protocol DiscoverViewModelOutput {
    var getGreeting: String { get }
    var categorise: [Classification] { get }
    var categoriseTitle: String { get }
    var forYou: [ForYou] { get }
    var forYouTitle: String { get }
    var ads: [Ads] { get }
    var partner: [Partner] { get }
    var partnerTitle: String { get }
}

final class DiscoverViewModel: DiscoverViewModelProtocol  {
    
    var input: DiscoverViewModelInput { return self }
    var output: DiscoverViewModelOutput { return self }
    
    //MARK: Private
    private var discoverRepository: DiscoverRepository
    private var discover: [Discover] = []

    //MARK: Input
    
    public func getDiscoverShelf() {
        self.discoverRepository.getDiscoverShelf() { (success, discover) in
            if success {
                self.discover = discover
            }
            self.didLoadFinish?()
        }
    }
    
    //MARK: Output
    
    var didLoadFinish: (() -> ())?
    
    public var getGreeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        if (hour >= 6) && (hour < 12) {
            return "อรุณสวัสดิ์!"
        } else if (hour >= 12) && (hour < 18) {
            return "สวัสดีตอนบ่าย!"
        } else if (hour >= 18) && (hour < 21) {
             return "สวัสดีตอนค่ำ!"
        } else {
             return "สวัสดี!"
        }
    }
    
    public var categorise: [Classification] {
        return self.discover.filter { $0.type == .categoty}.first?.categorise ?? []
    }
    
    public var categoriseTitle: String {
        return self.discover.filter { $0.type == .categoty}.first?.title ?? ""
    }
    
    public var forYou: [ForYou] {
        return self.discover.filter { $0.type == .forYou}.first?.forYou ?? []
    }
    
    public var forYouTitle: String {
        return self.discover.filter { $0.type == .forYou}.first?.title ?? ""
    }
    
    public var ads: [Ads] {
        return self.discover.filter { $0.type == .ads}.first?.ads ?? []
        
    }
    
    public var partner: [Partner] {
        return self.discover.filter { $0.type == .parner}.first?.partner ?? []
    }
    
    public var partnerTitle: String {
        return self.discover.filter { $0.type == .parner}.first?.title ?? ""
    }

    public init(discoverRepository: DiscoverRepository = DiscoverRepositoryImpl()) {
        self.discoverRepository = discoverRepository
    }
}
