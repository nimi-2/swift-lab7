//
//  Constants.swift
//  labidk
//
//  Created by student on 05/12/2024.
import Foundation
import SwiftUI

extension Animation{
    static func spin(duration: TimeInterval) -> Animation{
        return .linear(duration: duration).repeatForever(autoreverses: false)
    }
}
