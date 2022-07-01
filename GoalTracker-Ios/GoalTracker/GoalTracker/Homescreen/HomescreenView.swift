//
//  HomescreenView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 23/06/22.
//

import SwiftUI

struct HomescreenView: View {
    
    @State private var searchText = ""

    
    var body: some View {
        ZStack {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                SegmentedControls()
                    .tabItem {
                        Label("Goal", systemImage: "list.dash")
                    }.tag(1)
                SettingView()
                    .tabItem {
                        Label("Setting", systemImage: "gearshape")
                    }.tag(2)
            }
        }
    }
}

struct HomescreenView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
            HomescreenView()
//        }
    }
}
