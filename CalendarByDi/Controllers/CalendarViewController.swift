//
//  CalendarViewController.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 20.04.2023.
//

import UIKit
import FSCalendar

class CalendarConrtoller: UIViewController {
    
    var calendarChangeConstraint: NSLayoutConstraint!
    
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Calendar"
        setConstraints()
        
        
    }
}



//MARK настройка констрейнтов
extension CalendarConrtoller {
    func setConstraints() {
        view.addSubview(calendar)
        
        calendarChangeConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarChangeConstraint)
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),

        ])
    }
}
