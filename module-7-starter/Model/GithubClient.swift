//
//  GithubClient.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

import Foundation

class GitHubIssues: ObservableObject {
    
    @Published var openIssues: [GitHubIssue] = []
    @Published var closedIssues: [GitHubIssue] = []
    
    init() {
        let url = URL(string: "https://api.github.com/repos/apache/hadoop-ozone/issues?state=all")!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let issues = try? decoder.decode([GitHubIssue].self, from: data)
            
            DispatchQueue.main.async {
                if let issues = issues {
                    self.openIssues = issues.filter({ $0.state == "open" })
                    self.closedIssues = issues.filter({ $0.state == "closed" })
                }
            }
        }
        task.resume()
    }
}

func formatDate(date: String) -> String? {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM dd,yyyy"
    
    if let curdate = dateFormatterGet.date(from: date) {
        return dateFormatterPrint.string(from: curdate)
    } else {
       return nil
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
}

