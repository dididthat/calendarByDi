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
//    private let dayTimeLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
//        label.textAlignment = .left
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let toDoLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next", size: 20)
//        label.textAlignment = .right
//        label.adjustsFontSizeToFitWidth = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Description"
        
    }
//    private func setConstraints() {
//        let stackView = UIStackView()
//        stackView.addArrangedSubview(dayTimeLabel)
//        stackView.addArrangedSubview(toDoLabel)
//        stackView.axis = .horizontal
//        stackView.spacing = 10
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
//            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
//            stackView.heightAnchor.constraint(equalToConstant: 25)
//        ])
//    }
}
