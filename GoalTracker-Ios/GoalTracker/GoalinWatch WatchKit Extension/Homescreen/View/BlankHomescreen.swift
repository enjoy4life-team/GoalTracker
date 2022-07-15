//
//  BlankHomescreen.swift
//  GoalinWatch WatchKit Extension
//
//  Created by Imam Sutria on 14/07/22.
//

import SwiftUI

struct BlankHomescreen: View {
    var body: some View {
        VStack {
            Text("No Goal")
                .font(.title3)
                .bold()
                .padding()
            Text("Set your goal on iPhone first")
                .font(.caption2)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
    }
}

struct BlankHomescreen_Previews: PreviewProvider {
    static var previews: some View {
        BlankHomescreen()
    }
}
