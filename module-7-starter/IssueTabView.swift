//
//  IssueTabView.swift
//  module-7-starter
//
//  Created by Bryce Poeter on 2/26/22.
//

import SwiftUI

struct IssueTabView: View {
        
    var issues: [GitHubIssue]
    var issueState: IssueState
    
    var body: some View {
        NavigationView {
            List {
                ForEach(issues) { issue in
                    NavigationLink {
                        IssueDetail(issue: issue)
                    } label: {
                        HStack {
                            Image(systemName: issueState.iconName)
                                .foregroundColor(
                                    issueState.iconColor)
                            VStack {
                                Text(issue.title ?? "😢")
                                    .bold()
                                    .lineLimit(2)
                                Text("@" + issue.user.login)
                                    .italic()
                            }
                        }
                    }
                }
            }
            .navigationTitle(issueState.description + " Issues")
        }
    }
}


struct IssueTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        IssueTabView(issues: [GitHubIssue(title:
                                            Optional("HDDS-6395. TestReconScmHASnapshot.testScmHASnapshot often fails"),
                                          id: Optional(1155526144),
                                          createdAt: Optional("2022-03-01T16:09:15Z"),
                                          body: Optional("Sample Body"),
                                          state: Optional("open"),
                                          user: module_7_starter.GitHubUser(
                                            login: "sodonnel", avatarUrl: Optional("https://avatars.githubusercontent.com/u/4558007?v=4")))],
                     issueState: IssueState.closed)
    }
}
