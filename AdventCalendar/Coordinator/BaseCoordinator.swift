//
//  BaseCoordinator.swift
//  AdventCalendar
//
//  Created by Koushal, KumarAjitesh on 2020/03/03.
//  Copyright © 2020 Koushal, KumarAjitesh. All rights reserved.
//

import UIKit

final class BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Public methods
    
    func start() -> UIViewController {
        return initialViewController() ?? UIViewController()
    }
    
    //MARK: - Private methods
    
    /// - Returns: Instance of ViewController
    private func initialViewController() -> ViewController? {
        guard let vC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as? ViewController else { return nil }
        let viewModel = CalendarViewModel(onItemSelected: { item in
            self.showDetailsController(for: item)
        })
        vC.viewModel = viewModel
        return vC
    }

    /// - Returns: Instance of RecipeDetailViewController
    private func showDetailsController(for item: Int) {
        print(item)
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController")
        navigationController.pushViewController(detailVC, animated: true)
    }
}
