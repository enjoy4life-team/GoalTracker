//
//  SetActivityView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 23/06/22.
//

import SwiftUI

struct SetActivityView: View {
    
    @State private var setActivity = false
    
    var body: some View {
        List {
            HStack {
                Text("Set Activity")
                
                Toggle(isOn: $setActivity){
                }
            }
            .listStyle(.insetGrouped)
        }
    }
}

struct SetActivityView_Previews: PreviewProvider {
    static var previews: some View {
        SetActivityView()
    }
}
