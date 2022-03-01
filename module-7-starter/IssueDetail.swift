//
//  IssueDetail.swift
//  module-7-starter
//
//  Created by Bryce Poeter on 2/26/22.
//

import SwiftUI

struct IssueDetail: View {
    
    var issue: GitHubIssue
    
    // https://developer.apple.com/documentation/swiftui/asyncimage
    var body: some View {
        ScrollView(content: {
            Text(issue.title!)
                .font(.largeTitle)
            HStack {
                AsyncImage(
                    url: URL(string: issue.user.avatarUrl!),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 300, maxHeight: 100)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                Text("User:   @" + issue.user.login)
            }
            Text("Date:    " + formatDate(date: issue.createdAt!)!)
            Image(systemName: issue.state == "open" ? IssueState.open.iconName : IssueState.closed.iconName)
            Text(issue.body!)
        })
    }
        
//        HStack {
//            AsyncImage(url: URL(string: issue.user.avatarUrl!))
//                .frame(maxHeight: 50, maxWidth: 50) { image in
//                CircleImage(image: image)
//                    .frame(width: 20, height: 20)
//            } placeholder: {
//                ProgressView()
//            }
//
//            Text(issue.user.login)
//        }
    }


struct IssueDetail_Previews: PreviewProvider {
    static var previews: some View {
        IssueDetail(issue: GitHubIssues().closedIssues[0])
    }
}
