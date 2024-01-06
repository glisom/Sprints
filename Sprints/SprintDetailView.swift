//
//  SprintDetailView.swift
//  Sprints
//
//  Created by Grant Isom on 11/27/23.
//

import AVKit
import SwiftUI

struct SprintDetailView: View {
    @Binding var sprint: Sprint
    var onUpdate: ((Sprint?) -> ())? = nil
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(sprint.title)
                        .font(.title)
                        .bold()
                        .padding(.leading)
                        .multilineTextAlignment(.leading)
                    Text(sprint.desc ?? "")
                        .font(.subheadline)
                        .bold()
                        .multilineTextAlignment(.leading)
                }
                .padding(.leading)
                Spacer()
            }
            LinkPlayer(embedId: sprint.embedId)
            NewSprintView(title: sprint.title,
                          desc: sprint.desc ?? "",
                          color: Color(hex: sprint.color),
                          iterations: String(sprint.iterations),
                          onCreate: onUpdate,
                          isUpdate: true)
        }
    }
}

struct SprintDetailPreviewView: View {
    @State var sprint = Sprint(title: "Sprint Title", desc: "Sprint Description", embedId: "XxSgdX7lX6E", color: Color.blue, iterations: 12)

    var body: some View {
        SprintDetailView(sprint: $sprint)
    }
}

#Preview {
    SprintDetailPreviewView()
}
