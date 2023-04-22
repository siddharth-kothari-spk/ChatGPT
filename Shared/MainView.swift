//
//  MainView.swift
//  ChatGPTApp
//
//  Created by sidkotha on 22/04/23.
//

import SwiftUI

struct MainView: View {
    @State private var chatQueryText: String = ""
    
    private var isFormValid: Bool {
        !chatQueryText.isEmptyOrWhitespace
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                TextField("Search", text: $chatQueryText).textFieldStyle(.roundedBorder)
                Button {
                    // action
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
