//
//  Model.swift
//  ChatGPTApp
//
//  Created by sidkotha on 23/04/23.
//

import Foundation

class Model: ObservableObject {
    
    @Published var queries: [QueryModel] = []
    @Published var query = QueryModel(question: "", answer: "")
    func saveQuery(_ query: QueryModel) throws {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        let historyItem = HistoryItem(context: viewContext)
        historyItem.question = query.question
        historyItem.answer = query.answer
        historyItem.dateCreated = Date()
        try viewContext.save()
    }
}
