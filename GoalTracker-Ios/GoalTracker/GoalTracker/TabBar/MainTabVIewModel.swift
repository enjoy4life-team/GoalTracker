//
//  MainTabVIewModel.swift
//  GoalTracker
//
//  Created by Agus Budianto on 22/06/22.
//

import Foundation

final class MainTabViewModel: ObservableObject {

    @Published var selectedTab: TabItem = .home

    enum TabItem {
        case home
        case setting
    }
}
