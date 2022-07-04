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
    @State private var isAlertShowed = false
    
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea().opacity(0.1)
            
            VStack{
                List{
                    ForEach(viewModel.activities.indices, id: \.self) { idx in
                        HStack{
                            Text(viewModel.activities[idx].name ?? "null").padding(.vertical, 10)
                            if !isEditing {
                                NavigationLink(destination: TaskView(viewModel: SetTaskViewModel(activity: viewModel.activities[idx]))) { EmptyView() } // disabled  !
                            }
                            
                        }
                        
                    }
                    .onMove(perform: { from, to in
                        viewModel.moveData(fromOffsets: from, toOffset: to)
                    })
                    .onDelete(perform: { deletedOffsets in
                        viewModel.deleteData(idx: deletedOffsets)
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
            .navigationBarTitle(Text("Set Activity"), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                
                editMode = isEditing ? .inactive : .active
                isEditing.toggle()
            }){
                Text(isEditing ? "Done" : "Edit")
            }, trailing: Button(action: {
                
                isAlertShowed.toggle()
                
            }){
                Text("Save")
            })
        }.onAppear{
            print("appear")
        }
        .alert(isPresented: $isAlertShowed) {
            Alert(
                            title: Text("Are you sure you want to save the change?"),
                            primaryButton: .default(Text("Yes")){
                                viewModel.saveChanges()
                                presentationMode.wrappedValue.dismiss()
                            },
                            secondaryButton: .destructive(Text("No")) {
                                viewModel.cancelChanges()
                                presentationMode.wrappedValue.dismiss()
                            }
                        )
        }
        
    }
}


