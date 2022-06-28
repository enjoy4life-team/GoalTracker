//
//  SelectRepeat.swift
//  GoalTracker
//
//  Created by Imam Sutria on 25/06/22.
//

import SwiftUI

struct SelectRepeat: View {
    
    @State var repeatTask = "0"
    
    let less : String = "Less"
    let medium : String = "Medium"
    let long : String = "Long"
    
    var body: some View {
        List {
            Text(less)
            Text(medium)
            Text(long)
        }
        .listStyle(.insetGrouped)
    }
}

struct SelectRepeat_Previews: PreviewProvider {
    static var previews: some View {
        SelectRepeat()
    }
}
