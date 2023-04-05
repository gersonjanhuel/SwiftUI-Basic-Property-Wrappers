//
//  SwiftUIViewA.swift
//  BasicPropertyWrappers_HandsOn
//
//  Created by Gerson Janhuel on 05/04/23.
//

import SwiftUI

struct SwiftUIViewA: View {
    // mark the property as @State
    @State var greeting = "Hello"
    
    var body: some View {

        VStack {
            Text(greeting)
                .font(.largeTitle)
             
             Button("Change Greeting") {
                 // now its allowed to mutate the property value 
                 greeting = "Aloha!"
             }
             .padding()
             .buttonStyle(.borderedProminent)
        }

    }
}

struct SwiftUIViewA_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewA()
    }
}
