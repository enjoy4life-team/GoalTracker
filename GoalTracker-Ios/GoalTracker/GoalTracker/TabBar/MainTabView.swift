//
//  MainTabView.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import SwiftUI
import Introspect

struct MainTabView: View {
    
    @StateObject private var mainTabViewModel = MainTabViewModel()
    @ObservedObject private var goalViewModel = GoalViewModel()
    @State var searchText = ""
    @State var isSheetPresented = false
    @State var isMaxPopUpPresented = false
    @State var route: GoalViewMainScreen.Route?
    
    
    
    init() {
        UITabBar.appearance().standardAppearance = .defaultAppearance
        UITabBar.appearance().scrollEdgeAppearance = .defaultAppearance
    }
    
    var body: some View {
        NavigationView{
            
            TabView(selection: $mainTabViewModel.selectedTab){
                GoalViewMainScreen(viewModel: goalViewModel, parentRoute: $route)
                    .tabItem {
                        Label("Goal", systemImage: "list.dash")
                    }

                    .tag(MainTabViewModel.TabItem.home)
                
                SettingView()
                    .tabItem {
                        Label("Setting", systemImage: "gearshape")
                    }.tag(MainTabViewModel.TabItem.setting)
            }.onAppear{
                goalViewModel.getData()
            }.navigationBarTitleDisplayMode(.large)

            .navigationTitle(returnNaviBarTitle(tabSelection: self.mainTabViewModel.selectedTab))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        if mainTabViewModel.selectedTab == .home {
                            Button(){
                                let activeGoals = goalViewModel.goals.filter{!$0.isFinished()}
                                
                                if activeGoals.count >= 3 {
                                    isMaxPopUpPresented.toggle()
                                }else{
                                    isSheetPresented.toggle()
                                }
                                 
                            }label: {
                                Image(systemName: "plus")
                            }
                            .tint(.blue)
                        }
                    })
                }
                .fullScreenCover(isPresented: $isSheetPresented){
                    AddGoalTemplate(viewModel: goalViewModel, isSheetPresented: $isSheetPresented, parentRoute: $route)
                }.fullScreenCover(isPresented: $isMaxPopUpPresented){
                    MaxGoalPopUp(isPresented: $isMaxPopUpPresented)
                }
                
        }
        
    }
    
    func returnNaviBarTitle(tabSelection: MainTabViewModel.TabItem) -> String{//this function will return the correct NavigationBarTitle when different tab is selected.
        switch tabSelection{
        case .home: return "My Goals"
        case .setting: return "Setting"
        }
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
