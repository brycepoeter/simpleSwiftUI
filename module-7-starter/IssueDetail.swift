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
    // https://www.ioscreator.com/tutorials/swiftui-circular-image-tutorial
    var body: some View {
        ScrollView(content: {
            Text(issue.title!)
                .font(.largeTitle)
            HStack {
                    AsyncImage(
                        url: URL(string: issue.user.avatarUrl!),
                        content: { image in
                            image.resizable()
                                .frame(width: 150)
                                 .clipShape(Circle())
                                 .shadow(radius: 5)
                                 .overlay(Circle().stroke(Color.black, lineWidth: 5))
                            
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                Text("User:   @" + issue.user.login)
            }
            .frame(maxHeight: 200)
            HStack {
                Image(systemName: issue.state == "open" ? IssueState.open.iconName : IssueState.closed.iconName)
                    .resizable()
                    .foregroundColor(issue.state == "open" ?
                                     IssueState.open.iconColor : IssueState.closed.iconColor)
                    .frame(width: 35, height: 35)
                Text("Date:    " + formatDate(date: issue.createdAt!)!)
                    .frame(minHeight: 60)
            }
            Text(issue.body!)
        })
    }
    }


struct IssueDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            IssueDetail(issue:
                            GitHubIssue(title: Optional("HDDS-6395. TestReconScmHASnapshot.testScmHASnapshot often fails"),
                                        id: Optional(1155526144),
                                        createdAt: Optional("2022-03-01T16:09:15Z"),
                                        body: Optional("## What changes were proposed in this pull request?\r\n\r\nI\'ve seen this test fail quite a few times on various PRs. I don\'t think there is an existing Jira for it:\r\n\r\n```\r\n Error:  Tests run: 1, Failures: 1, Errors: 0, Skipped: 0, Time elapsed: 59.752 s <<< FAILURE! - in org.apache.hadoop.ozone.recon.TestReconScmHASnapshot\r\nError:  ..."),
                                        state: Optional("open"),
                                        user: module_7_starter.GitHubUser(
                                            login: "sodonnel",
                                            avatarUrl: Optional("https://avatars.githubusercontent.com/u/4558007?v=4"))))
        }
    }
}
