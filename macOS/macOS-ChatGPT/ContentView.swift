//
//  ContentView.swift
//  macOS-ChatGPT
//
//  Created by sidkotha on 22/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            HistoryView()
        } detail: {
            MainView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
