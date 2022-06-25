//
//  SetActivityView.swift
//  GoalTracker
//
//  Created by Agus Budianto on 24/06/22.
//

import SwiftUI

struct SetActivityView: View {
    
    @ObservedObject var viewModel: SetActivityViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var setActivity = true
    @State private var editMode: EditMode = .inactive
    @State private var isEditing = false
    
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea().opacity(0.1)
            
            VStack{
                HStack{
                    Text("Set Activity")
                        .font(.headline)
                        .padding(.leading, 16)
                    Spacer()
                    Toggle(isOn: $setActivity){
                    }
                    .padding(.trailing, 16)
                }.frame(width: 358, height: 51)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                    .padding(.top, 48)
                
                List{
                    ForEach(viewModel.activities.indices, id: \.self) { idx in
                        HStack{
                            Text(viewModel.activities[idx].name ?? "").padding(.vertical, 10)
                            if !isEditing {
                                NavigationLink(destination: Text("D")) { EmptyView() } // disabled  !
                            }
                            
                        }
                                                
                    }
                    .onMove(perform: { from, to in
                        viewModel.moveData(fromOffsets: from, toOffset: to)
                    })
                    .onDelete(perform: { deletedOffsets in
                        
                    })
                    Label {
                        Text("New Activity")
                    } icon: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.green)
                    }

                    
                }
                .environment(\.editMode, $editMode)
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationBarTitle(Text("Detail View"), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                editMode = isEditing ? .inactive : .active
                isEditing.toggle()
                viewModel.saveChanges()
            }){
                Text(isEditing ? "Done" : "Edit")
            }, trailing: Button(action: {

                
                presentationMode.wrappedValue.dismiss()

            }){
                Text("Save")
            })
        }.onAppear{
            viewModel.getData()
        }
    }
}


