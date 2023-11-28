//
//  ProgressView.swift
//  Sprints
//
//  Created by Grant Isom on 11/18/23.
//

import SwiftUI

struct SprintProgressView: View {
    var sprint: Sprint
    var height: CGFloat = 22
    var spacing: CGFloat = 2
    var unselectedColor: Color = Color.secondary.opacity(0.3)
    var onShowDetail: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.sprint.title)
                    .font(.headline)
                if let desc = self.sprint.desc {
                    Text(desc)
                        .font(.body)
                }
                withAnimation(.spring) {
                    HStack(spacing: spacing) {
                        ForEach(0 ..< self.sprint.iterations, id: \.self) { index in
                            Rectangle()
                                .foregroundColor(index < self.sprint.completedIterations ? Color(hex: self.sprint.color) : self.unselectedColor)
                        }
                    }
                    .frame(height: height)
                    .clipShape(Capsule())
                }
                ControlGroup {
                    Button(action: { self.sprint.completedIterations = (self.sprint.completedIterations - 1) % (self.sprint.iterations - 1) }) {
                        Label("Decrease", systemImage: "minus")
                    }

                    Button(action: { self.sprint.completedIterations = (self.sprint.completedIterations + 1) % (self.sprint.iterations + 1) }) {
                        Label("Increase", systemImage: "plus")
                    }
                }
                .frame(width: 80)
            }
            Button(action: {
                onShowDetail()
            }, label: {
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .tint(Color(hex: sprint.color))
            })
            .padding(.leading)
        }
    }
}

struct ExampleOfProgress: View {
    @State var sprint: Sprint = .init(title: "22 Day Challenge", desc: "Stretching Challenge from Athlean-X", embedId: "XxSgdX7lX6E", color: Color.blue, iterations: 7)

    var body: some View {
        SprintProgressView(sprint: sprint, onShowDetail: {})
    }
}

#Preview {
    ExampleOfProgress()
}
