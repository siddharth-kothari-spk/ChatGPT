//
//  MainView.swift
//  ChatGPTApp
//
//  Created by sidkotha on 22/04/23.
//

import SwiftUI
import OpenAISwift

struct MainView: View {
    @State private var chatQueryText: String = "k"
    // temp var
    @State private var answers: [String] = []
    let openAI = OpenAISwift(authToken: "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")
    
    private var isFormValid: Bool {
        !chatQueryText.isEmptyOrWhitespace
    }
    
    private func performSearch() {
        openAI.sendCompletion(with: chatQueryText, maxTokens: 500) { result in
            switch result {
            case .success(let success):
                print("success: \(success)")
                let answer = success.choices?.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                guard !answer.isEmpty else {return}
                answers.append(answer)
            case .failure(let failure):
                print("failure: \(failure)")
            }
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                TextField("Search", text: $chatQueryText).textFieldStyle(.roundedBorder)
                Button {
                    // action
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
