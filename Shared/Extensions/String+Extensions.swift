//
//  String+Extensions.swift
//  ChatGPTApp
//
//  Created by sidkotha on 22/04/23.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
