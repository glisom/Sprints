//
//  NewSprintView.swift
//  Sprints
//
//  Created by Grant Isom on 11/18/23.
//

import SwiftUI

struct NewSprintView: View {
    @State var title: String = ""
    @State var desc: String = ""
    @State var color: Color = .accentColor
    @State var iterations: String = ""
    var onCreate: ((Sprint?) -> ())? = nil

    func createSprint(completion: (Sprint?) -> ()) {
        if title != "", let its = Int(iterations) {
            completion(Sprint(title: title, desc: desc, color: color, iterations: its))
        } else {
            return completion(nil)
        }
    }

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(
                        "Sprint Title",
                        text: $title
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Description (Optional)",
                        text: $desc
                    )
                    TextField("Iterations", text: $iterations)
                        .keyboardType(.numberPad)
                }

                Section {
                    ColorPicker("Pick a color", selection: $color)
                }

                Button(action: {
                    self.createSprint { sprint in
                        if let onCreate = self.onCreate {
                            onCreate(sprint)
                        }
                    }
                }) {
                    Text("Create New Sprint")
                }
            }
        }
    }
}

#Preview {
    NewSprintView()
}
