//
//  MainTabView.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject private var mainTabViewModel = MainTabViewModel()
    @ObservedObject private var goalViewModel = GoalViewModel()
    
    init() {
        UITabBar.appearance().standardAppearance = .defaultAppearance
        UITabBar.appearance().scrollEdgeAppearance = .defaultAppearance
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $mainTabViewModel.selectedTab){
                GoalMainScreen(viewModel: goalViewModel)
                    .tabItem {
                        Label("Goals", systemImage: "list.dash")
                    }.tag(MainTabViewModel.TabItem.home)
                
                Settings()
                    .tabItem {
                        Label("Setting", systemImage: "square.and.pencil")
                    }.tag(MainTabViewModel.TabItem.setting)
            }.onAppear{
                goalViewModel.getData()
            }
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
