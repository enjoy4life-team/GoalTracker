//
//  HomescreenFillView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 23/06/22.
//

import SwiftUI

struct GoalItemEmpty: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {   
                ZStack {
                    Text("Tap + to add goal")
                }
            }
        
    }
}

struct HomescreenFillView_Previews: PreviewProvider {
    static var previews: some View {
        GoalItemEmpty()
    }
}
