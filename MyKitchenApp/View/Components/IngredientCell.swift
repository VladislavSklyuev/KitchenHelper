//
//  IngredientCell.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 28.06.2023.
//

import SwiftUI

struct IngredientCell: View {
    
    let viewModel: IngredientCellViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.position.substance.title)
                .font(.title3.bold())
            Spacer()
            Text(String(format: "%.3f", viewModel.position.amount))
                .font(.title3)
            Text(viewModel.position.measure.shorttitle)
                .font(.title3)
        }.padding(.horizontal, 8)
            .padding(.vertical, 4)
            .foregroundColor(.white)
    }
}

struct IngredientCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCell(viewModel: IngredientCellViewModel(position: IngredientPosition(substance: Substance.substances[0], amount: 150, measure: Measure.measures[1])))
    }
}
