//
//  Complication.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Agus Budianto on 19/07/22.
//

import SwiftUI

struct ComplicationViewRectangular: View {
    var data: Complication
    var body: some View {
      HStack{
        VStack (alignment: .leading){
            Text(data.goalName).font(.body)
            .fontWeight(.medium)
            Text(data.activityName).font(.body)
            .fontWeight(.light)
            Text("Today, \(data.time.formattedString())").font(.body)
            .fontWeight(.light)
        }.padding([.leading, .trailing])
        Spacer()
      }
  //    }.border(width: 3, edges: [.leading, .trailing, .top, .bottom], color: .yellow)
    }
}

struct ComplicationViewEmpty: View {
    var body: some View {
      HStack{
        VStack (alignment: .leading){
            Text("No Activity Today").font(.body)
            .fontWeight(.medium)
            
        }.padding([.leading, .trailing])
        Spacer()
      }
  //    }.border(width: 3, edges: [.leading, .trailing, .top, .bottom], color: .yellow)
    }
}


extension Date {

    func formattedString(_ format: String = "hh:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}


