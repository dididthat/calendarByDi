//
//  ToDoManager.swift
//  CalendarByDi
//
//  Created by Diana Nikulina on 23.04.2023.
//

import Foundation
protocol ToDoManagerDelegate: AnyObject {
    func updateToDos()
}

final class ToDoManager {
    weak var delegate: ToDoManagerDelegate?
    var currentToDos: [ToDoModel] = []
    var toDos: [ToDoModel] = []
    func getToDo(complition: @escaping () ->Void) {
//        toDos = [ToDoModel(id: 1, dateStart: "1682270061.8451629", dateFinish: "23.03", name: "lal", description: "kakka"), ToDoModel(id: 2, dateStart: "ddd", dateFinish: "23.03", name: "lal", description: "kakka"),
//                 ToDoModel(id: 3, dateStart: "kkk", dateFinish: "23.03", name: "lal", description: "kakka")]
//        complition()
        DispatchQueue.global().async {
            self.toDos = self.getJSONData()
            DispatchQueue.main.async {
                complition()
            }
        }
        
    }
    func  showToDos(date: Date) {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        currentToDos = toDos.filter({ toDoModel in
            guard let toDoDate = toDoModel.getDateStart()
            else {return false}
            let toDoDay = calendar.component(.day, from: toDoDate)
            return day == toDoDay
        })
        delegate?.updateToDos()
    }
    func currentTodoForHour(hour: Int) -> ToDoModel? {
        guard 00<=hour && hour<=24 else {return nil}
        let calendar = Calendar.current
        return currentToDos.filter { toDoModel in
            guard let toDoDate = toDoModel.getDateStart()
            else {return false}
            let toDoHour = calendar.component(.hour, from: toDoDate)
            return toDoHour == hour
        }.sorted { todo1, todo2 in
            return (todo1.dateStart ?? "")<=(todo2.dateStart ?? "")
        }.first// взять первый элемент если есть
        
    }
    func getJSONData() -> [ToDoModel] {
        if let path = Bundle.main.path(forResource: "ToDo", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode([ToDoModel].self, from: data)
                return jsonResult
            } catch {
                return []
            }
        }else{return []}
    }
}
