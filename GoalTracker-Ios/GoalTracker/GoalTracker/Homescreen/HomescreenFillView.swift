//
//  HomescreenFillView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 23/06/22.
//

import SwiftUI

struct HomescreenFillView: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
//                    Text("Searching for \(searchText)")
//                        .searchable(text: $searchText)
                    
                    TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                        Text("Tap + to add goal")
                            .tabItem {
                                Label("Goal", systemImage: "list.dash")
                            }.tag(1)
                        Text("Tab Content 2")
                            .tabItem {
                                Label("Setting", systemImage: "gearshape")
                            }.tag(2)
                    }
                    
                    
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle("My Goals")
                
                .toolbar {
                    Button ("Add"){
                        
                    }
                }
                .searchable(text: $searchText, prompt: "Goal, Activity and More")
            }
        }
    }
}

struct HomescreenFillView_Previews: PreviewProvider {
    static var previews: some View {
        HomescreenFillView()
    }
}
