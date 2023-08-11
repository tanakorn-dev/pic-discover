//
//  DiscoverOpener.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 14/5/2564 BE.
//

import UIKit
import Core
import UseCase

public enum DiscoverScene {
    case discover
    case categories([Classification])
}

public struct DiscoverOpener {
    
    public static func open(_ discoverScene: DiscoverScene) -> UIViewController {
        switch discoverScene {
        case .discover:
            let storyboard: UIStoryboard = UIStoryboard(name: DiscoverNibVars.Storyboard.discover, bundle: ConfigBundle.discover)
            let vc = storyboard.instantiateViewController(withIdentifier: DiscoverNibVars.ViewController.discover)
            return vc
        case .categories(let categories):
            let storyboard: UIStoryboard = UIStoryboard(name: DiscoverNibVars.Storyboard.categories, bundle: ConfigBundle.discover)
            let vc = storyboard.instantiateViewController(withIdentifier: DiscoverNibVars.ViewController.categories) as! CategoriesViewController
            vc.categories = categories
            return vc
        }
    }
    
}
