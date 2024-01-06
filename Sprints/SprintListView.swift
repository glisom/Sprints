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
    @State var selectedSprint: Sprint?
    @State private var preferredColumn =
        NavigationSplitViewColumn.sidebar

    var body: some View {
        NavigationSplitView(preferredCompactColumn: self.$preferredColumn) {
            ScrollView {
                Section {
                    ForEach(self.sprints) { sprint in
                        SprintProgressView(sprint: sprint, onShowDetail: {
                            self.preferredColumn = .detail
                            self.selectedSprint = sprint
                        })
                        Divider()
                    }
                }
            }
            .padding()
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
            if let selectedSprint = self.selectedSprint {
                let binding = Binding { selectedSprint } set: { self.selectedSprint = $0 }

                SprintDetailView(sprint: binding) { sprint in
                    if let sprint = sprint {
                        print(sprint)
                        self.selectedSprint = sprint
                        self.preferredColumn = .sidebar
                        self.selectedSprint = nil
                    }
                }
            }
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
