//
//  FirstScreen.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 29.06.2023.
//

import SwiftUI

struct FirstScreen: View {
    @Environment (\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Button("OK") {
                dismiss()
            }
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
