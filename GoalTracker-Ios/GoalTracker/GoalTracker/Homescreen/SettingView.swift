//
//  SettingView.swift
//  GoalTracker
//
//  Created by Imam Sutria on 24/06/22.
//

import SwiftUI
import Introspect


struct SettingView: View {
    
    var body: some View {
            List {
                darkMode()

                Section ("Privacy") {
                    privacyPolicy()
                }

                Section ("More") {
                    aboutUs()
                    tellAFriend()
                    rate()
                }
            }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct darkMode: View {
    
    @State private var isToggleOn = false
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.purple)
                    .frame(width: 30, height: 30)
                    .cornerRadius(6)
                
                Label ("", systemImage: "hand.raised.slash.fill")
                    .foregroundColor(.white)
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
            }
            VStack (alignment: .leading) {
                Text("Dark Mode")
                    .font(.headline)
                Text("Display setting light-colored text")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            Toggle("", isOn: $isToggleOn)
        }
    }
}

struct privacyPolicy: View {
    var body: some View {
        NavigationLink(destination: PrivacyPolicyView() .navigationTitle("Privacy Policy")){
            HStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(.pink)
                        .frame(width: 30, height: 30)
                        .cornerRadius(6)
                    
                    Label ("", systemImage: "hand.raised.slash.fill")
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                        .padding(.bottom, 2)
                }
                VStack (alignment: .leading){
                    Text("Privacy Policy")
                        .font(.headline)
                    Text("Read documents manages client data")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
            }
        }
    }
}

//MORE
struct tellAFriend: View {
    var body: some View {
        Button(action: {tellaFriend()}) {
            HStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 30)
                        .cornerRadius(6)
                    
                    Label ("", systemImage: "arrowshape.turn.up.forward.fill")
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                        .padding(.bottom, 4)
                }
                VStack (alignment: .leading){
                    Text("Tell a Friend")
                        .font(.headline)
                    Text("Tell your friends about our app")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
            }
        }
        .foregroundColor(.black)
    }
}

struct aboutUs: View {
    var body: some View {
        NavigationLink(destination: AboutUsView() .navigationTitle("About Us")){
            HStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.init(red: 255, green: 0, blue: 196))
                        .frame(width: 30, height: 30)
                        .cornerRadius(6)
                    
                    Label ("", systemImage: "hand.wave.fill")
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                        .padding(.bottom, 2)
                }
                VStack (alignment: .leading){
                    Text("About Us")
                        .font(.headline)
                    Text("Know us more")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
            }
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
                
                Label ("", systemImage: "heart.fill")
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                    .padding(.bottom, 1)
            }
            VStack (alignment: .leading){
                Text("Rate")
                    .font(.headline)
                Text("Help us to be better")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical)
        }
    }
}


