//
//  CalendarTableViewCell.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 23.04.2023.
//

import UIKit

final class CalendarTableViewCell: UITableViewCell {
    
    static let idCalendarCell = "idCalendarCell"
    
    private let dayTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let toDoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func fill(time:String?, todo:String?) {
        dayTimeLabel.text = time
        toDoLabel.text = todo
        
    }
    private func setConstraints() {
        let stackView = UIStackView()
        stackView.addArrangedSubview(dayTimeLabel)
        stackView.addArrangedSubview(toDoLabel)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            stackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
