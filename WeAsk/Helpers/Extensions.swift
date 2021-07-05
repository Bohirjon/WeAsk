//
//  StringExtensions.swift
//  WeAsk
//
//  Created by Bohirjon Akhmedov on 05/07/21.
//

import Foundation

extension String {
    var isEmailValid : Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
