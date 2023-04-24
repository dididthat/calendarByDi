//
//  CalendarViewController.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 20.04.2023.
//

import UIKit
import FSCalendar

final class CalendarViewController: UIViewController {
    
    private var calendarChangeConstraint: NSLayoutConstraint!
    
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    private let showHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "что-то", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var toDoManager = ToDoManager()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Calendar"
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = .week
        
        //MARK: регистрация ячейки
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.idCalendarCell)
        
        setConstraints()
        swipeCalendar()
        
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = (UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddButtonTap)))
        toDoManager.delegate = self
        toDoManager.getToDo {
            self.toDoManager.showToDos(date: Date())
        }
        
    }
    @objc func AddButtonTap() {
        let calendarOption = OptionsCalendarViewController()
        navigationController?.pushViewController(calendarOption, animated: true)
    }
    
    
    @objc func showHideButtonTapped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Close", for: .normal)
        }
        else {
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Open", for: .normal)
        }
    }
    
    //MARK: Свайпать календарь
    
    func swipeCalendar(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        calendar.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleSwipe(motion: UISwipeGestureRecognizer){
        switch motion.direction {
        case .up:
            showHideButtonTapped()
        case .down:
            showHideButtonTapped()
        default:
            break
        }
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.idCalendarCell, for: indexPath) as! CalendarTableViewCell
        
        let timeHours = "\(indexPath.row):00"
        
        let toDo = toDoManager.currentTodoForHour(hour: indexPath.row)
        
        if let toDo {
            cell.fill(time: timeHours, todo: toDo.name)
        } else {cell.fill(time: timeHours, todo: nil)}
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoManager.currentTodoForHour(hour: indexPath.row)
        
        if let toDo {
            let descriptionVC = DescriptionViewConrtoller()
            descriptionVC.toDo = toDo
            navigationController?.pushViewController(descriptionVC, animated: true)
        }
    }
    
}

//MARK: Подписываемся под протоколы FSCalendarDataSource, FSCalendarDelegate

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarChangeConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        toDoManager.showToDos(date: date)
    }
}


//MARK: настройка констрейнтов

private extension CalendarViewController {
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
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: showHideButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
extension CalendarViewController: ToDoManagerDelegate {
    func updateToDos() {
        tableView.reloadData()
        
        //            DispatchQueue.main.async {
        //                complition()
        //            }
    }
}

