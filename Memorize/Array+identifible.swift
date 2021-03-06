//
//  Array+identifible.swift
//  Memorize
//
//  Created by Matheus Henrique on 18/06/21.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
