//
//  ContentView.swift
//  module-7-starter
//
//  Created by Andrew Binkowski on 2/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var githubIssues: GitHubIssues
    

    var body: some View {

    // https://developer.apple.com/documentation/swiftui/tabview
        TabView {
            IssueTabView(issues: githubIssues.openIssues, issueState: IssueState.open)
            .badge(githubIssues.openIssues.count)
                .tabItem {
                    Image(systemName: "lock.open")
                    Text("Open")
                }
                
            IssueTabView(issues: githubIssues.closedIssues, issueState: IssueState.closed)
                .badge(githubIssues.closedIssues.count)
                .tabItem {
                    Image(systemName: "lock")
                    Text("Closed")
                }
        }
        .accentColor(.orange)
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(githubIssues: GitHubIssues())
    }
}
