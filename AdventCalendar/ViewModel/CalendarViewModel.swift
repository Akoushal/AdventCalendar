//
//  CalendarViewModel.swift
//  AdventCalendar
//
//  Created by Koushal, KumarAjitesh on 2020/03/03.
//  Copyright © 2020 Koushal, KumarAjitesh. All rights reserved.
//

import Foundation

class CalendarViewModel {
    
    //MARK: - Closures for callback
    var onItemSelected: (Int) -> Void
    var showAlertClosure: (() -> ())?
    
    init(onItemSelected: @escaping (Int) -> Void) {
        self.onItemSelected = onItemSelected
    }
    
    /// To inform the view model that an item was tapped.
    /// View model executes call back for item selection from coordinator.
    func didSelectItem(with tag: Int) {
        if compareItemToCurrentDate(for: tag) {
            onItemSelected(tag)
        } else {
            self.showAlertClosure?()
        }
    }
    
    //Compare selectedItem to current date
    private func compareItemToCurrentDate(for item: Int) -> Bool {
        let date = Date()
        let day = Calendar.current.component(.day, from: date)
        return item > day ? false : true
    }
}
