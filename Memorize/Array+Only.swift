//
//  Array+Only.swift
//  Memorize
//
//  Created by Matheus Henrique on 22/06/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
