//
//  SwiftUIViewC.swift
//  BasicPropertyWrappers_HandsOn
//
//  Created by Gerson Janhuel on 05/04/23.
//

import SwiftUI

struct SwiftUIViewC: View {

    @State var isToggle: Bool = false
     
    var body: some View {
        VStack {
            // read and write the state
            Toggle(isOn: $isToggle) {
                Text("💡")
                    .font(.largeTitle)
            }
            .frame(width: 100)
            
            // only read the state
            Text("Light state is \(isToggle ? "ON" : "OFF")")
                .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background((isToggle) ? Color.yellow : Color.gray)
        
    }
}

struct SwiftUIViewC_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewC()
    }
}
