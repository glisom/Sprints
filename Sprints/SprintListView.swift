//
//  ContentView.swift
//  Sprints
//
//  Created by Grant Isom on 11/17/23.
//

import SwiftData
import SwiftUI

struct SprintListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var sprints: [Sprint]
    @State var showNewSprintSheet = false

    var body: some View {
        NavigationSplitView {
            List {
                Section {
                    ForEach(self.sprints) { sprint in
                        SprintProgressView(sprint: sprint)
                    }
                }
                .onDelete(perform: self.deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: self.addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: self.$showNewSprintSheet, content: {
            NewSprintView(onCreate: { sprint in
                if let sprint = sprint {
                    self.modelContext.container.mainContext.insert(sprint)
                    self.showNewSprintSheet.toggle()
                }

            })
            .presentationDetents([.medium])
        })
    }

    private func addItem() {
        self.showNewSprintSheet.toggle()
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                self.modelContext.delete(self.sprints[index])
            }
        }
    }
}

#Preview {
    SprintListView()
        .modelContainer(for: Sprint.self, inMemory: true)
}
