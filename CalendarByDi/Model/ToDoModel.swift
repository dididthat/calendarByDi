//
//  ToDoModel.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 23.04.2023.
//

import Foundation
struct ToDoModel: Codable {
    let id: Int?
    let dateStart, dateFinish, name, description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case dateStart = "date_start"
        case dateFinish = "date_finish"
        case name, description
    }
    
    
    func getDateStart() -> Date? {
        return getDateFromTimestamp(dateStart)
    }
    
    func getDateFinish() -> Date? {
        return getDateFromTimestamp(dateFinish)
    }
    
    private func getDateFromTimestamp(_ timestamp: String?) -> Date? {
        guard
                let timestamp,
                let timeInterval = TimeInterval(timestamp) else {
                return nil
            }
            return Date(timeIntervalSince1970: timeInterval)


    }
}
