//
//  TableViews.swift
//  Catalog
//
//  Created by Barbara Personal on 2024-08-30.
//
import SwiftUI

struct User: Identifiable {
    let id: Int
    var name: String
    var score: Int
}

struct TableViews: View {
    @State private var users = [
        User(id: 1, name: "User Number 1", score: 95),
        User(id: 2, name: "User Number 2", score: 80),
        User(id: 3, name: "User Number 3", score: 85)
    ]
    @State private var sortOrder = [KeyPathComparator(\User.name)]
     
    var body: some View {
        Table(users, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.name)
            TableColumn("Score") { user in
                Text(String(user.score))
            }
        }
        .onChange(of: sortOrder) { oldValue, newValue in
            users.sort(using: newValue)
        }
    }
}

#Preview {
    TableViews()
}
