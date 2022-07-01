//
//  SegmentedControls.swift
//  GoalTracker
//
//  Created by Imam Sutria on 30/06/22.
//

import SwiftUI

struct SegmentedControls: View {
    
    init() {
//        UISegmentedControl.appearance().sel
        
    }
    
    @State private var selectedStatus : GoalStatus = .gOnGoing
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Choose", selection: $selectedStatus) {
                    ForEach(GoalStatus.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Spacer()
                ChooseGoalStatusView(selectedStatus: selectedStatus)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("My Goals")
            
    //            .searchable(text: $searchText)
            
            .toolbar {
                Button ("Add"){
                    
                }
            }
        }

    }
}

struct SegmentedControls_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControls()
    }
}

enum GoalStatus: String, CaseIterable {
    case gOnGoing = "On Going"
    case gCompleted = "Completed"
    case gArchive = "Archive"
}

struct ChooseGoalStatusView: View {
    var selectedStatus: GoalStatus
    
    var body: some View {
        switch selectedStatus {
        case .gOnGoing:
            GoalView()
        case .gCompleted:
            CompletedView()
        case .gArchive:
            ArchiveView()
        }
    }
}
