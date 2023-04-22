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
    
    let showHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "что-то", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Calendar"
        calendar.delegate = self
        calendar.dataSource = self
        setConstraints()
        calendar.scope = .week
        
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
    }
    @objc func showHideButtonTapped() {
        print("tap")
    }
}
//MARK: Подписываемся под протоколы
extension CalendarConrtoller: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarChangeConstraint.constant = bounds.height
        view.layoutIfNeeded()
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
        view.addSubview(showHideButton)
        
        NSLayoutConstraint.activate([
            showHideButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
            showHideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            showHideButton.widthAnchor.constraint(equalToConstant: 100),
            showHideButton.heightAnchor.constraint(equalToConstant: 20)

        ])
    }
}
