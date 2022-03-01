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
