//
//  QueryModel.swift
//  ChatGPTApp
//
//  Created by sidkotha on 23/04/23.
//

import Foundation

struct QueryModel: Identifiable, Hashable {
    let id = UUID()
    let question: String
    let answer: String
}
