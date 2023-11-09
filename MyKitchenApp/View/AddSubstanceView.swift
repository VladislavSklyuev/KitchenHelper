//
//  AddSubstanceView.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 29.06.2023.
//

import SwiftUI

struct AddSubstanceView: View {
    
    @StateObject var viewModel = AddSubstanceViewModel()
    @EnvironmentObject var converterVM: ConverterViewModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            Text("Новый ингредиент")
                .font(.title2).bold()
                .padding()
            TextField("Название ингредиента", text: $viewModel.title)
                .padding()
            HStack {
                Text("Плотность")
                    .padding()
                Text("\(String(format: "%.0f", viewModel.density))")
            }
            Slider(value: $viewModel.density, in: 500...2500, step: 10)
            
            
            Button("Сохранить") {
                viewModel.save()
                converterVM.getSubstances()
                dismiss()
            }
                .padding(.horizontal)
        }
        
    }
}

struct AddSubstanceView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubstanceView()
    }
}
