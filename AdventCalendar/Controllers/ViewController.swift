//
//  ViewController.swift
//  AdventCalendar
//
//  Created by Koushal, KumarAjitesh on 2020/03/03.
//  Copyright © 2020 Koushal, KumarAjitesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Injection
    
    var viewModel: CalendarViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Advent Calendar"
        // Do any additional setup after loading the view.
    }

    //MARK: - IBAction Methods
    @IBAction func itemTapped(sender: UIButton) {
        viewModel?.didSelectItem(with: sender.tag)
        
        viewModel?.showAlertClosure = {
            self.presentAlert()
        }
    }
}

// MARK: - Alert Protocol
extension ViewController: AlertPresentable {
    
    var alertComponents: AlertComponents {
        let okAction = AlertActionComponent(title: "OK", style: .cancel, handler: nil)
        let alertComponents = AlertComponents(title: "Error", message: "Selected date exceeds current date", actions: [okAction], completion: nil)
        return alertComponents
    }
}
