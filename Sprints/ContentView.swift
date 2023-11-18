//
//  ContentView.swift
//  Sprints
//
//  Created by Grant Isom on 11/17/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var sprints: [Sprint]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(sprints) { sprint in
                    NavigationLink {
                        Text("\(sprint.title)")
                    } label: {
                        Text(sprint.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
//            let newSprint = Item(timestamp: Date())
//            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(sprints[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Sprint.self, inMemory: true)
}
