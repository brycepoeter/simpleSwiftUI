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
                                    issueState == IssueState.open ?
                                        .green : .red)
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
//        NavigationView {
//        List (issues) { item in
//            NavigationLink("LocalizedStringKey") {
//                IssueDetail()
//            }
//            HStack {
//                Image(systemName: issueState.iconName)
//                    .foregroundColor(.green)
//                VStack {
//                    Text(item.title ?? "😢")
//                        .bold()
//                        .lineLimit(2)
//                    Text("@" + item.user.login)
//                        .italic()
//                }
//            }
//        }
//        .navigationTitle(issueState.description + " Issues")
//        }
//    }


struct IssueTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        IssueTabView(issues: GitHubIssues().closedIssues, issueState: IssueState.closed)
    }
}
