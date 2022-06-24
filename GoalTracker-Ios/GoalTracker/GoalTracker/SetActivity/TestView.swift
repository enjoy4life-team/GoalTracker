//
//  TestView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 23/06/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationView{
            SetActivityView()
            
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Set Activity")
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
