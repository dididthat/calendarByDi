//
//  TasksViewController.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 20.04.2023.
//
//
import UIKit

final class DescriptionViewConrtoller: UIViewController {
    
    
    var toDo: ToDoModel?
    
    private let nameToDoLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    private let dateToDoLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    private let timeToDoLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    private let descriptionToDoLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let date = toDo?.getDateStart() {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let day = calendar.component(.day, from: date)
            let month = calendar.component(.month, from: date)
            let year  = calendar.component(.year, from: date)
            timeToDoLabel.text = "\(hour):\(minutes)"
            dateToDoLabel.text = "\(day).\(month).\(year)"
        }
        
        nameToDoLabel.text = toDo?.name
        descriptionToDoLabel.text = toDo?.description
        
        view.backgroundColor = .white
        title = "Description"
        
        setupView()
    }
    
    private func setupView() {
        let stackView = UIStackView()
        
        stackView.addArrangedSubview(nameToDoLabel)
        stackView.addArrangedSubview(dateToDoLabel)
        stackView.addArrangedSubview(timeToDoLabel)
        stackView.addArrangedSubview(descriptionToDoLabel)
        stackView.addArrangedSubview(UIView())
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .top
        
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -30).isActive = true
        
    }
}
