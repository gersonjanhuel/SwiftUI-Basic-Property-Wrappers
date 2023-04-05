//
//  ContentView.swift
//  BasicPropertyWrappers_HandsOn
//
//  Created by Gerson Janhuel on 05/04/23.
//

import SwiftUI

struct ContentView: View {
    // store new data in property
    var greeting = "Hello"
    
    var body: some View {

        VStack {
            // call the property here
            Text(greeting)
                .font(.largeTitle)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
