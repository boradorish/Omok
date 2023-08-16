//
//  GameTheme.swift
//  Omok
//
//  Created by snulife on 2023/07/08.
//

import Foundation
import SwiftUI
enum GameTheme: String, Codable, Identifiable, CaseIterable{
    var id: String { rawValue }
    
    case brown
    case white
    case black
    
    var color: Color{
        switch self {
        case .brown: return Color.brown
        case .white: return Color.white
        case .black: return Color.black
        }
    }
}
