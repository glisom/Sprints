//
//  ProgressView.swift
//  Sprints
//
//  Created by Grant Isom on 11/18/23.
//

import SwiftUI

struct SprintProgressView: View {
    var value: Int
    var maximum: Int = 7
    var height: CGFloat = 28
    var spacing: CGFloat = 2
    var selectedColor: Color = .accentColor
    var unselectedColor: Color = Color.secondary.opacity(0.3)

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< maximum) { index in
                Rectangle()
                    .foregroundColor(index < self.value ? self.selectedColor : self.unselectedColor)
            }
        }
        .frame(maxHeight: height)
        .clipShape(Capsule())
    }
}

struct ExampleOfProgress: View {
    @State var value = 0
    var maximum = 10

    var body: some View {
        VStack(alignment: .leading) {
            Text("Title of Sprint")
                .font(.headline)
            Text("Additional description of the sprint.")
                .font(.body)
            withAnimation(.bouncy(duration: 0.5, extraBounce: 0.5)) {
                SprintProgressView(value: value, maximum: maximum)
                    .padding(.vertical)
            }
            ControlGroup {
                Button(action: { self.value = (self.value - 1) % (self.maximum - 1) }) {
                    Label("Decrease", systemImage: "minus")
                }

                Button(action: { self.value = (self.value + 1) % (self.maximum + 1) }) {
                    Label("Increase", systemImage: "plus")
                }
            }
            .frame(width: 80)
        }
        .padding()
    }
}

#Preview {
    ExampleOfProgress()
}
