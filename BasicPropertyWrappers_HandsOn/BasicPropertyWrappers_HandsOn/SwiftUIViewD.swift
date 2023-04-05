//
//  SwiftUIViewD.swift
//  BasicPropertyWrappers_HandsOn
//
//  Created by Gerson Janhuel on 05/04/23.
//

import SwiftUI

struct SwiftUIViewD: View {
    // local variable... is called property
    @State var number: Int = 1
    @State var name = "Gerson"
    
    var body: some View {
        VStack {
            
            // read the value
            Text("Property value is \(number)")
                .padding(.bottom)
            
            Button {
                // LOGIC
                // manipulate the value
                number = number + 1
                print(number)
                
            } label: {
                Text("+ 1")
                .frame(maxWidth: .infinity)
            }
            .frame(width: 180)
            .buttonStyle(.borderedProminent)
            .font(.largeTitle)
            .padding(.bottom, 20)
            
            Divider()
                .padding(.bottom, 20)
            
            // View that can modify a property value
            TextField("Name...", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250)
            
            // read the value
            Text("Name you type is \(name)")
                .padding(.top)
                .fontWeight(.bold)
        }
    
        
    }
}

struct SwiftUIViewD_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewD()
    }
}
