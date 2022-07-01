//
//  SegmentedControls.swift
//  GoalTracker
//
//  Created by Imam Sutria on 30/06/22.
//

import SwiftUI

struct SegmentedControls: View {
    @ObservedObject var viewModel: GoalViewModel
    @State private var selectedStatus : GoalStatus = .gOnGoing
    
    init(viewModel: GoalViewModel){
        self.viewModel = viewModel
      
    }
    
    var body: some View {
            VStack {
                Picker("Choose", selection: $selectedStatus) {
                    ForEach(GoalStatus.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Spacer()
                ChooseGoalStatusView(selectedStatus: selectedStatus, viewModel: viewModel)
                Spacer()
            }

    }
}

//struct SegmentedControls_Previews: PreviewProvider {
//    static var previews: some View {
//        SegmentedControls()
//    }
//}

enum GoalStatus: String, CaseIterable {
    case gOnGoing = "On Going"
    case gCompleted = "Completed"
    case gArchive = "Archive"
}

struct ChooseGoalStatusView: View {
    var selectedStatus: GoalStatus
    @ObservedObject var viewModel: GoalViewModel

    var body: some View {
        switch selectedStatus {
        case .gOnGoing:
            GoalViewItem(viewModel: viewModel)
        case .gCompleted:
            CompletedView(viewModel: viewModel)
        case .gArchive:
            ArchiveView(viewModel: viewModel)
        }
    }
}
