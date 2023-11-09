//
//  ConverterView.swift
//  KitchenApp2
//
//  Created by Владислав Склюев on 27.06.2023.
//

import SwiftUI

struct ConverterView: View {
    
   
    @StateObject var viewModel = ConverterViewModel()
    
    @State var showEditView = false
    
    @State var newValue = 0.0
    
    @State var currentPos: IngredientPosition?
    
    @State var showCD =  false
    
    @State var showAddSubstanceView =  false
    
    @State var showAddMeasure = false
    
    @State var showFirstScreen = false
    
    var body: some View {
        VStack(spacing: 8) {
                HStack(spacing: 10) {
                    TextField("",
                              value: $viewModel.inputValue,
                              format: .number,
                              prompt: Text("Количество").foregroundColor(.black))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("c4").opacity(0.8))
                        .clipShape(Capsule())
                        .foregroundColor(.black)
                        .keyboardType(.decimalPad)
                    
                    Picker(selection: $viewModel.inMeasure) {
                        ForEach(viewModel.measures) { measure in
                            Text(measure.title)
                         .tag(measure)
                        }
                    } label: {
                        Text("Мера")
                    }
                    .pickerStyle(.menu)
                        .padding(8)
                        .frame(width: 150)
                        .background(Color("c4").opacity(0.8))
                        .clipShape(Capsule())
                        .foregroundColor(.black)
                    
            }
            
            HStack(spacing: 10) {
                Text(String(format: "%.3f", viewModel.resultValue))
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("c4").opacity(0.5))
                    .clipShape(Capsule())
                    .foregroundColor(.black)
                
                Picker(selection: $viewModel.outMeasure) {
                    ForEach(viewModel.measures) { measure in
                        Text(measure.title)
                     .tag(measure)
                    }
                } label: {
                    Text("Мера")
                }
                .pickerStyle(.menu)
                    .padding(8)
                    .frame(width: 150)
                    .background(Color("c4").opacity(0.8))
                    .clipShape(Capsule())
                    .foregroundColor(.black)
        }
            
            Picker(selection: $viewModel.selectedSubstance) {
                ForEach(viewModel.substances) { substance in
                    Text(substance.title)
                 .tag(substance)
                }
            } label: {
                Text("Ингредиент")
            }
            .pickerStyle(.menu)
                .padding(8)
                .frame(maxWidth: .infinity)
                .background(Color("c4").opacity(0.8))
                .clipShape(Capsule())
                .foregroundColor(.black)
            
            HStack {
                Button("Запомнить") {
                    viewModel.createPosition()
                }
                .padding()
//                .fontWeight(.black)
                .frame(maxWidth: .infinity)
                .background(.white.opacity(0.6))
                .clipShape(Capsule())
                .foregroundColor(.black)
                
                Button("Посчитать") {
                    viewModel.solve()
                }
                .padding()
//                .fontWeight(.black)
                .frame(maxWidth: .infinity)
                .background(Color("c2").opacity(0.6))
                .clipShape(Capsule())
                .foregroundColor(.white)
            }
            //MARK: Таблица
            List {
                ForEach(viewModel.positions) { position in
                    IngredientCell(viewModel: IngredientCellViewModel(position: position))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .swipeActions(edge: .trailing,
                                      allowsFullSwipe: true) {
                            Button {
                                viewModel.deletePosition(position)
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                        }
//                                      .swipeActions(edge: .leading, allowsFullSwipe: false) {
//                                          Button {
//                                              self.currentPos = position
//                                              self.newValue = position.amount
//                                              showEditView.toggle()
//                                          } label: {
//                                              Image(systemName: "pencil")
//                                          }
//                                          .tint(.green)
//                                      }
                }
            }
            .listStyle(.plain)
            .background(.black.opacity(0.6))
            .cornerRadius(24)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("bg2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .offset(x: -70)
            
        )
        .overlay(alignment: .bottomTrailing) {
            Button {
                showCD.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .padding()
                    .background(Color("c4").opacity(0.4))
                    .clipShape(Circle())
                    .padding()
                    .foregroundColor(.white)
            }

        }
        .overlay {
            EditView()
                .offset(y: showEditView ? 0 : 600)
        }
        .animation(.easeInOut(duration: 0.3), value: showEditView)
        
        .sheet(isPresented: $showAddSubstanceView) {
            AddSubstanceView()
                .environmentObject(viewModel)
        }
        
        .sheet(isPresented: $showAddMeasure) {
            AddMeasureView()
                .environmentObject(viewModel)
        }
        
        .fullScreenCover(isPresented: $showFirstScreen) {
            FirstScreen()
        }
    }
    
    @ViewBuilder
    func EditView() -> some View {

        VStack {
            Text("Введите новое количество:")
                .font(.title3.bold())
            TextField("Новое количество", value: $newValue, format: .number)
                .padding()
                .background(.white)
                .cornerRadius(12)
                .shadow(radius: 1)
            Button {
                
                guard let currentPos else { return }
                viewModel.changeValue(newValue, forPosition: currentPos)
                showEditView.toggle()
            } label: {
                Text("Готово!")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("c2").opacity(0.6))
                    .cornerRadius(12)
                    .foregroundColor(.black)
                
            }

        }
        .frame(width: 300)
        .padding()
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 2)
        .confirmationDialog("Что вы хотите добавить?",
                            isPresented: $showCD,
                            titleVisibility: .visible) {
            Button("Ингредиент") {
                showAddSubstanceView.toggle()
            }
            Button("Меру") {
                showAddMeasure.toggle()
            }
            Button("Отмена", role: .cancel) { }
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
