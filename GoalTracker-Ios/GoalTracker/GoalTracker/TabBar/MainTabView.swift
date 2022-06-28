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
            TabView(selection: $mainTabViewModel.selectedTab){
                GoalViewMainScreen(viewModel: goalViewModel)
                    .tabItem {
                        Label("Goal", systemImage: "list.dash")
                    }.tag(MainTabViewModel.TabItem.home)
                       
                SettingView()
                    .tabItem {
                        Label("Setting", systemImage: "gearshape")
                    }.tag(MainTabViewModel.TabItem.setting)
            }.onAppear{
                goalViewModel.getData()
            }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
