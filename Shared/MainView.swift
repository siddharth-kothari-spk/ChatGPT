//
//  MainView.swift
//  ChatGPTApp
//
//  Created by sidkotha on 22/04/23.
//

import SwiftUI
import OpenAISwift

struct MainView: View {
    @State private var chatQueryText: String = ""
    @EnvironmentObject private var model: Model
    @State private var isSearching: Bool = false
    
    let openAI = OpenAISwift(authToken: Constants.openAIKey)
    
    private var isFormValid: Bool {
        !chatQueryText.isEmptyOrWhitespace
    }
    
    private func performSearch() {
        openAI.sendCompletion(with: chatQueryText, maxTokens: 500) { result in
            switch result {
            case .success(let success):
               // print("success: \(success)")
                
                let answer = success.choices?.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                guard !answer.isEmpty else {return}
                
                let query = QueryModel(question: chatQueryText, answer: answer)
                // appending to QueryModel
                DispatchQueue.main.async {
                    model.queries.append(query)
                }
                
                // saving in DB
                do {
                    try model.saveQuery(query)
                }
                catch {
                    print(error.localizedDescription)
                }
                chatQueryText = ""
                isSearching = false
                
            case .failure(let failure):
                isSearching = false
                print("failure: \(failure)")
            }
        }
    }
    
    var body: some View {
        VStack {
            ScrollView { //
                
                // ScrollViewReader allow us to scroll to particular location
                ScrollViewReader { proxy in
                    ForEach(model.queries, id:\.id) { query in
                        VStack(alignment: .leading) {
                            Text(query.question)
                                .fontWeight(.bold)
                            Text(query.answer)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.bottom], 10)
                            .id(query.id)
                            .listRowSeparator(.hidden)
                    }.listStyle(.plain)
                        .onChange(of: model.query) { query in
                            if !model.queries.isEmpty {
                                let lastQuery = model.queries[model.queries.endIndex - 1]
                                withAnimation {
                                    proxy.scrollTo(lastQuery.id)
                                }
                            }
                        }
                }
                
                
            }.padding()
            
            Spacer()
            HStack {
                TextField("Search", text: $chatQueryText).textFieldStyle(.roundedBorder)
                Button {
                    // action
                    isSearching = true
                    performSearch()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45))
                }.buttonStyle(.borderless)
                    .tint(.blue)
                    .disabled(!isFormValid)
                // buttonStyle and tint for mac app

            }
        }.padding()
            .onChange(of: model.query) { query in
                model.queries.append(query)
            }
            .overlay(alignment: .center) {
                if isSearching {
                    ProgressView("Searching...")
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
    }
}
