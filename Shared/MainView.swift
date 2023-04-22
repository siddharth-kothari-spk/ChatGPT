//
//  MainView.swift
//  ChatGPTApp
//
//  Created by sidkotha on 22/04/23.
//

import SwiftUI

struct MainView: View {
    @State private var chatQueryText: String = ""
    var body: some View {
        VStack {
            Spacer()
            TextField("Search", text: $chatQueryText).textFieldStyle(.roundedBorder)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
