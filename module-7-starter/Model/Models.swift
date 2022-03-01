//
//  Models.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

import Foundation
import SwiftUI

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String?
}

struct GitHubIssue: Codable, Identifiable {
    let title: String?
    // We can use GitHub to conformt to `Identifiable`
    let id: UInt32?
    let createdAt: String?
    let body: String?
    let state: String?
    let user: GitHubUser
}

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .border(.black)
    }
}

// https://stackoverflow.com/questions/24701075/swift-convert-enum-value-to-string
enum IssueState: CustomStringConvertible {
    case open
    case closed
    
    var description: String {
        switch self {
        case .open: return "Open"
        case .closed: return "Closed"
        }
    }
    
    var iconName: String {
        switch self {
        case .open: return "lock.open"
        case .closed: return "lock"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .open: return Color.green
        case .closed: return Color.red
        }
    }
}
