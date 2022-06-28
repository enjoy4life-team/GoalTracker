//
//  TestView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 23/06/22.
//

import SwiftUI

struct TestView: View {
    
    @State var test = "Scripting"
    
    var body: some View {
        NavigationView {
            List {
                Section{
                    NavigationLink(destination: SetSubtaskView()) {
                        Text("\(test)")
                    }
                    .navigationTitle("Set Activity")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .listStyle(.insetGrouped)
            
                .navigationBarItems(
                    leading: Button(action: {
    //                    dismiss()
                    }, label: { Text("Cancel") }),

                    trailing: Button(action: {
                        
                    }, label: { Text("Done") })
                )
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
