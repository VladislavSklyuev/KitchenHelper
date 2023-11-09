//
//  AddMeasureView.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 29.06.2023.
//

import SwiftUI

struct AddMeasureView: View {
    
    @StateObject var viewModel = AddMeasureViewModel()
    @EnvironmentObject var converterVM: ConverterViewModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            
            Text("Добавление новой меры")
                .frame(width: 300, height: 35)
                .background(.white).opacity(0.9)
                .cornerRadius(12)
                .font(.title3).bold()
            
            TextField("Название", text: $viewModel.title)
                .padding()
                .frame(width: 300, height: 35)
                .background(.white).opacity(0.9)
                .cornerRadius(12)
                .font(.body).bold()
            
            TextField("Короткое название", text: $viewModel.shorttitle)
                .padding()
                .frame(width: 300, height: 35)
                .background(.white).opacity(0.9)
                .cornerRadius(12)
                .font(.body).bold()

            
            Toggle("Вес или объём?", isOn: $viewModel.isWeight)
                .padding()
                .frame(width: 300, height: 35)
                .background(.white).opacity(0.9)
                .cornerRadius(12)

            
            HStack {
                
                Text("Base Coeff")
                    .frame(width: 190, height: 35)
                    .background(.white).opacity(0.9)
                    .cornerRadius(12)
                
                TextField("", value: $viewModel.baseCoeff, format: .number)
                    .padding()
                        .frame(width: 100, height: 35)
                        .background(.white).opacity(0.9)
                        .cornerRadius(12)
                        .font(.title3).bold()
            }

            Button("Сохранить") {
                viewModel.save()
                //converterVM.getMeasures()
                dismiss()
            }
            .foregroundColor(.yellow)
            .frame(width: 300, height: 35)
            .background(.white)
            .cornerRadius(12)
            .font(.title3).bold()
                //.padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("mera")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
    }
}

struct AddMeasureView_Previews: PreviewProvider {
    static var previews: some View {
        AddMeasureView()
    }
}
