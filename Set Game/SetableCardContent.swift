//
//  SetableCardContent.swift
//  Set Game
//
//  Created by Александр Котляров on 08.02.2021.
//

import SwiftUI

protocol SetableCardContent {
    static func isSet(card contents: [Self]) -> Bool
}
