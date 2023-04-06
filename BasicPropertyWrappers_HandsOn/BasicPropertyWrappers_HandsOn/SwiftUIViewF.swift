//
//  SwiftUIViewF.swift
//  BasicPropertyWrappers_HandsOn
//
//  Created by Gerson Janhuel on 06/04/23.
//

import SwiftUI

struct SwiftUIViewF: View {
    @State private var lampName = ""
    @State private var isLampOn = false
    
    var body: some View {
        VStack {
            
            Text("Lamp name is\n\(lampName)")
                .font(.title)
                .multilineTextAlignment(.center)
            
            TextField("Your lamp name", text: $lampName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Toggle(isOn: $isLampOn) {
                Text("ON/OFF")
            }
            
        }
        .padding(.horizontal, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background((isLampOn) ? Color.yellow : Color.gray)
    }
}

struct SwiftUIViewF_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewF()
    }
}
