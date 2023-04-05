//
//  SwiftUIViewB.swift
//  BasicPropertyWrappers_HandsOn
//
//  Created by Gerson Janhuel on 05/04/23.
//

import SwiftUI

struct SwiftUIViewB: View {
    // mark the property as @State
    @State var greeting = "Hello"
    
    var body: some View {

        VStack {
            Text(greeting)
                .font(.largeTitle)
             
            ExtractedView(greeting: $greeting)
        }

    }
}

struct ExtractedView: View {
    // bind the property with the source of truth (any parent view that assign this property)
    @Binding var greeting: String
    
    var body: some View {
        Button("Change Greeting") {
            // now its allowed to mutate the property value
            // changes here... also reflected in parent view
            greeting = "Aloha!"
        }
        .padding()
        .buttonStyle(.borderedProminent)
    }
}


struct SwiftUIViewB_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewB()
    }
}


