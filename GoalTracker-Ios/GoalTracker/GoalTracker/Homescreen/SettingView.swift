//
//  SettingView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 24/06/22.
//

import SwiftUI

struct SettingView: View {
    
    var body: some View {
        NavigationView {
            List {
                darkMode()
                
                Section ("Privacy") {
                    privacyPolicy()
                }
                
                Section ("More") {
                    tellAFriend()
                    aboutUs()
                    rate()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Setting")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

//Dark Mode
struct darkMode: View {
    
    @State private var isToggleOn = false
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.purple)
                    .frame(width: 30, height: 30)
                    .cornerRadius(6)
                
                Image(systemName: "moon.circle")
                    .foregroundColor(Color.white)

            }
            .padding(.vertical, 10)
            .padding(.leading, 5)
            .padding(.trailing, 10)
            
            
            ZStack {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Dark Mode")
                            .font(.headline)
                        Text("Display setting light-colored text")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                    
                }
                Toggle("", isOn: $isToggleOn)
            }
        }
    }
}

//Privacy Policy
struct privacyPolicy: View {
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.pink)
                    .frame(width: 30, height: 30)
                    .cornerRadius(6)
                
                Image(systemName: "hand.raised.slash.fill")
                    .foregroundColor(Color.white)
            }
            .padding(.vertical, 10)
            .padding(.leading, 5)
            .padding(.trailing, 10)
            
            VStack (alignment: .leading){
                Text("Privacy Policy")
                    .font(.headline)
                Text("Read documents manages client data")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
        }
    }
}

//MORE
struct tellAFriend: View {
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 30, height: 30)
                    .cornerRadius(6)
                
                Image(systemName: "arrowshape.turn.up.forward.fill")
                    .foregroundColor(Color.white)
            }
            .padding(.leading, 5)
            .padding(.trailing, 10)
            
            VStack (alignment: .leading){
                Text("Tell a Friend")
                    .font(.headline)
                
                Text("Let your friends know our app")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 10)
        }
    }
}

struct aboutUs: View {
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.init(red: 255, green: 0, blue: 196))
                    .frame(width: 30, height: 30)
                    .cornerRadius(6)
                
                Image(systemName: "hand.wave.fill")
                    .foregroundColor(Color.white)
            }
            .padding(.leading, 5)
            .padding(.trailing, 10)
            
            VStack (alignment: .leading){
                Text("About Us")
                    .font(.headline)
                Text("Know us more")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 10)
        }
    }
}

struct rate: View {
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.mint)
                    .frame(width: 30, height: 30)
                    .cornerRadius(6)
                
                Image(systemName: "heart.fill")
                    .foregroundColor(Color.white)
            }
            .padding(.leading, 5)
            .padding(.trailing, 10)
            
            VStack (alignment: .leading){
                Text("Rate")
                    .font(.headline)
                Text("Help us to be better")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 10)
        }
    }
}
