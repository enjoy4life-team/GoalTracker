//
//  SettingViewModel.swift
//  GoalTracker
//
//  Created by Mikhael Budi Mulya Marpaung on 30/06/22.
//

import SwiftUI
import Foundation

struct AboutUsView: View {
    var body: some View {
            ScrollView{
                VStack(alignment: .center){
                    HStack{
                        Spacer()
                        VStack{
                            Image("memoAl")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Alex")
                                .bold()
                                .font(.caption)
                            Text("Product Manager")
                                .font(.caption2)
                        }
                        VStack{
                            Image("memoJo")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Jovanka")
                                .bold()
                                .font(.caption)
                            Text("Designer")
                                .font(.caption2)
                        }
                        VStack{
                            Image("memoAg")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Agus")
                                .bold()
                                .font(.caption)
                            Text("Developer")
                                .font(.caption2)
                        }
                        
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Image("memoKa")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Kael")
                                .bold()
                                .font(.caption)
                            Text("Developer")
                                .font(.caption2)
                        }
                        VStack{
                            Image("memoIm")
                                .resizable()
                                .frame(width: 99, height: 99)
                                .padding(.bottom, -10)
                            Text("Imam")
                                .bold()
                                .font(.caption)
                            Text("Developer")
                                .font(.caption2)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 30)
                    VStack(alignment: .leading){
                        Text("We would like to ask you for a favour.")
                            .font(.headline)
                            .bold()
                            
                        Text("We would like to ask you for a small favour that can help learn music theory and hopefully help more people with understanding music theory.")
                            .font(.subheadline)
                    }
                    .padding([.leading, .trailing],30)
                    .padding(.bottom)
                    VStack(alignment: .leading){
                        Text("Why do we ask you for this and how it can be helpful for Goalin?")
                            .font(.headline)
                            .bold()
                        Text("Apple basically grades apps by a lot of factors and one of the more important ones is reviews. This means that getting more reviews will help us rank higher and get more exposure.")
                            .font(.subheadline)
                    }
                    .padding([.leading, .trailing],30)
                    .padding(.bottom)
                    VStack(alignment: .leading){
                        Text("What does this mean to us? ")
                            .font(.headline)
                            .bold()
                        Text("It would mean the world to us - literally. As indie developers working on Goalin as a side project, the feedback from our users is precious. So we will really appreciate your 15 seconds and will be more than happy to finish our day reading your reviews.")
                            .font(.subheadline)
                    }
                    .padding([.leading, .trailing],30)
                    .padding(.bottom)
            }
        }
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.9354777932, green: 0.9454266429, blue: 0.9624565244, alpha: 1))
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    Text("Last updated: *bind here*")
                        .font(.subheadline)
                    VStack(alignment: .leading){
                        Text("Overview")
                            .bold()
                            .padding(.bottom, -5)
                        Text("""
    Goalin app does not collect any personal data. All counters information that you input into the  Goalin app remains privately stored on your device.

    We take your privacy very seriously. Goalin app always want make better development decisions and choose where to focus development effort. Goalin app does not share, sell or rent your data, and the anonymous information is only collected to help make the app better.
    """)
                     .padding(.bottom)
                        
                        Text("Your Consent")
                            .bold()
                            .padding(.bottom, -5)
                        Text("By using Goalin app, you consent to this privacy policy.")
                     .padding(.bottom)
                    
                        Text("Changes to this Privacy Policy")
                            .bold()
                            .padding(.bottom, -5)
                        Text("""
    We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. These changes are effective immediately after they are posted on this page. Contact Us If you have any questions or suggestions, you can contact us at contact [at] notetrainer [dot] com If you contact us through this email, we will see your name and email address. Your information is only to assist us in providing customer support to you and won’t be added to a mailing list or sold to a third-party company. If you wish, you may email us to remove your name and email address from our inbox.
    """)
                     .padding(.bottom)
                        
                        Text("Contact Us")
                            .bold()
                            .padding(.bottom, -5)
                        Text("""
    If you have any questions or suggestions, you can contact us at contact [at] Goalin [dot] com

    If you contact us through this email, we will see your name and email address. Your information is only to assist us in providing customer support to you and won’t be added to a mailing list or sold to a third-party company. If you wish, you may email us to remove your name and email address from our inbox.
    """)
                     .padding(.bottom)
                    }
                    .padding([.trailing, .leading], 20)
                }
            }
        }
    }
}

func tellaFriend() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
}


