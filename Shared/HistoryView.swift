//
//  HistoryView.swift
//  ChatGPTApp
//
//  Created by sidkotha on 04/05/23.
//

import SwiftUI

struct HistoryView: View {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)])
    private var historyItemResults: FetchedResults<HistoryItem>
    
    @EnvironmentObject private var model: Model
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List(historyItemResults) { historyItem in
            Text(historyItem.question ?? "")
                .frame(maxWidth: .infinity, alignment:.leading).contentShape(Rectangle())
                .onTapGesture {
                    model.query = QueryModel(question: historyItem.question ?? "", answer: historyItem.answer ?? "")
                    dismiss()
                }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environmentObject(Model())
    }
}
