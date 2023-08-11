//
//  DiscoverViewController.swift
//  Discover
//
//  Created by Tanakorn Phoochaliaw on 13/5/2564 BE.
//

import UIKit
import Core
import PanModal
import UseCase

class DiscoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    private let viewModel = DiscoverViewModel()
    
    enum HomeViewControllerSection: Int, CaseIterable {
        case greeting = 0
        case wallet
        case categorise
        case suggest
        case ads
        case partner
        case footer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.configureTableView()
    }
    
    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: DiscoverNibVars.TableViewCell.greeting, bundle: ConfigBundle.discover), forCellReuseIdentifier: DiscoverNibVars.TableViewCell.greeting)
        self.tableView.register(UINib(nibName: DiscoverNibVars.TableViewCell.wallet, bundle: ConfigBundle.discover), forCellReuseIdentifier: DiscoverNibVars.TableViewCell.wallet)
        self.tableView.register(UINib(nibName: DiscoverNibVars.TableViewCell.category, bundle: ConfigBundle.discover), forCellReuseIdentifier: DiscoverNibVars.TableViewCell.category)
        self.tableView.register(UINib(nibName: DiscoverNibVars.TableViewCell.suggest, bundle: ConfigBundle.discover), forCellReuseIdentifier: DiscoverNibVars.TableViewCell.suggest)
        self.tableView.register(UINib(nibName: DiscoverNibVars.TableViewCell.partner, bundle: ConfigBundle.discover), forCellReuseIdentifier: DiscoverNibVars.TableViewCell.partner)
        self.tableView.register(UINib(nibName: DiscoverNibVars.TableViewCell.footer, bundle: ConfigBundle.discover), forCellReuseIdentifier: DiscoverNibVars.TableViewCell.footer)
        self.tableView.register(UINib(nibName: DiscoverNibVars.TableViewCell.ads, bundle: ConfigBundle.discover), forCellReuseIdentifier: DiscoverNibVars.TableViewCell.ads)
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
    }
    
    // MARK: - BindableViewModel
    func bindViewModel() {
        self.viewModel.input.getDiscoverShelf()
        
        self.viewModel.didLoadFinish = {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeViewControllerSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case HomeViewControllerSection.categorise.rawValue:
            return (self.viewModel.output.categorise.count > 0 ? 1 : 0)
        case HomeViewControllerSection.suggest.rawValue:
            return (self.viewModel.output.forYou.count > 0 ? 1 : 0)
        case HomeViewControllerSection.ads.rawValue:
            return (self.viewModel.output.ads.count > 0 ? 1 : 0)
        case HomeViewControllerSection.partner.rawValue:
            return (self.viewModel.output.partner.count > 0 ? 1 : 0)
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case HomeViewControllerSection.greeting.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverNibVars.TableViewCell.greeting, for: indexPath as IndexPath) as? GreetingTableViewCell
            cell?.greeting = self.viewModel.output.getGreeting
            return cell ?? UITableViewCell()
        case HomeViewControllerSection.wallet.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverNibVars.TableViewCell.wallet, for: indexPath as IndexPath) as? WalletTableViewCell
            cell?.delegate = self
            return cell ?? UITableViewCell()
        case HomeViewControllerSection.categorise.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverNibVars.TableViewCell.category, for: indexPath as IndexPath) as? CategoryTableViewCell
            cell?.delegate = self
            cell?.configure(withCategories: self.viewModel.output.categorise)
            return cell ?? UITableViewCell()
        case HomeViewControllerSection.suggest.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverNibVars.TableViewCell.suggest, for: indexPath as IndexPath) as? SuggestTableViewCell
            cell?.configure(withForYou: self.viewModel.output.forYou, title: self.viewModel.output.forYouTitle)
            return cell ?? UITableViewCell()
        case HomeViewControllerSection.ads.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverNibVars.TableViewCell.ads, for: indexPath as IndexPath) as? AdsTableViewCell
            cell?.ads = self.viewModel.output.ads.first
            return cell ?? UITableViewCell()
        case HomeViewControllerSection.partner.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverNibVars.TableViewCell.partner, for: indexPath as IndexPath) as? PartnerTableViewCell
            cell?.configure(withPartner: self.viewModel.output.partner, title: self.viewModel.output.partnerTitle)
            return cell ?? UITableViewCell()
        case HomeViewControllerSection.footer.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverNibVars.TableViewCell.footer, for: indexPath as IndexPath) as? FooterTableViewCell
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

extension DiscoverViewController: WalletTableViewCellDelegate {
    func walletTableViewCellDidSelectTopup(_ cell: WalletTableViewCell) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Wallet", bundle: nil)
//        let selectSourceOfFundViewController = storyBoard.instantiateViewController(withIdentifier: "SelectSourceOfFundViewController") as? SelectSourceOfFundViewController
//        selectSourceOfFundViewController?.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(selectSourceOfFundViewController ?? SelectSourceOfFundViewController(), animated: true)
    }
    
    func walletTableViewCellDidSelectHistory(_ cell: WalletTableViewCell) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Wallet", bundle: nil)
//        let walletHistoryViewController = storyBoard.instantiateViewController(withIdentifier: "WalletHistoryViewController") as? WalletHistoryViewController
//        walletHistoryViewController?.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(walletHistoryViewController ?? WalletHistoryViewController(), animated: true)
    }
    
    func walletTableViewCellDidSelectCoupon(_ cell: WalletTableViewCell) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Coupon", bundle: nil)
//        let couponViewController = storyBoard.instantiateViewController(withIdentifier: "CouponViewController") as? CouponViewController
//        couponViewController?.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(couponViewController ?? CouponViewController(), animated: true)
    }
}

extension DiscoverViewController: CategoryTableViewCellDelegate {
    func didSelectMoreCategory() {
        let storyBoard: UIStoryboard = UIStoryboard(name: DiscoverNibVars.Storyboard.categories, bundle: ConfigBundle.discover)
        let categoriesViewController = storyBoard.instantiateViewController(withIdentifier: DiscoverNibVars.ViewController.categories) as? CategoriesViewController
        categoriesViewController?.delegate = self
        categoriesViewController?.categories = self.viewModel.output.categorise
        presentPanModal(categoriesViewController ?? CategoriesViewController())
    }
    
    func categoryTableViewCell(_ cell: CategoryTableViewCell, didSelectCategory category: Classification) {
        // TO DO: - Go to list view
    }
}

extension DiscoverViewController: CategoriesViewControllerDelegate {
    func categoriesViewController(_ view: CategoriesViewController, didSelectCategory category: Classification) {
        // TO DO: - Go to list view
    }
}
