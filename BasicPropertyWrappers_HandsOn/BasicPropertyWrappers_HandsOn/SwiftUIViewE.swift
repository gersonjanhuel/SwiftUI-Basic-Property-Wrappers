//
//  SwiftUIViewE.swift
//  BasicPropertyWrappers_HandsOn
//
//  Created by Gerson Janhuel on 06/04/23.
//

import SwiftUI

struct SwiftUIViewE: View {
    @State private var color = Color.black
    @State private var date = Date()
    @State private var slider = 0.75
    @State private var stepper = 1
    @State private var text = "This is one-way binding"
    @State private var textField = "This is two-way binding"
    @State private var prize = "dua"
    @State private var toggle = true
    
    var body: some View {
        NavigationView {
            Form {
                ColorPicker("Color Picker", selection: $color)
                DatePicker(selection: $date) {
                    Text("Date")
                }
                Slider(value: $slider)
                Stepper(value: $stepper, in: 0...100) {
                    Text("Value: \(stepper)")
                }
                
                // pake ini aja.
                
                Text(text)
                TextField("Placeholder", text: $textField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Toggle(isOn: $toggle) {
                    Text("Toggle")
                }
            }
            .navigationTitle("Controls")
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

struct SwiftUIViewE_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewE()
    }
}
