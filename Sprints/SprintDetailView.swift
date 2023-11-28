//
//  SprintDetailView.swift
//  Sprints
//
//  Created by Grant Isom on 11/27/23.
//

import AVKit
import SwiftUI

struct SprintDetailView: View {
    var sprint: Sprint
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(sprint.title)
                        .font(.title)
                        .bold()
                        .padding(.leading)
                        .multilineTextAlignment(.leading)
                        .frame(width: .infinity)
                    Text(sprint.desc ?? "")
                        .font(.subheadline)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .frame(width: .infinity)
                }
                .padding(.leading)
                Spacer()
            }
            LinkPlayer(embedId: sprint.embedId)
            NewSprintView(title: sprint.title,
                          desc: sprint.desc ?? "",
                          color: Color(hex: sprint.color),
                          iterations: String(sprint.iterations),
                          isUpdate: true)
        }
    }
}

var sprint = Sprint(title: "Sprint Title", desc: "Sprint Description", embedId: "XxSgdX7lX6E", color: Color.blue, iterations: 12)
#Preview {
    SprintDetailView(sprint: sprint)
}
