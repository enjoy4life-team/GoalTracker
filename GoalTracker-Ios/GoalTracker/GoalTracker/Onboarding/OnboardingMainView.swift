//
//  OnboardingMainView.swift
//  GoalTracker
//
//  Created by Agus Budianto on 30/06/22.
//

import SwiftUI

struct OnboardingMainView: View {
    @Binding var sheetPresented: Bool
    init(sheetPresented: Binding<Bool>) {
        UIPageControl.appearance().currentPageIndicatorTintColor = .white
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.5)
        self._sheetPresented = sheetPresented
        
    }
    
    @State var selectedTab = 0
    var body: some View {
        GeometryReader { geo in
        ZStack{
            Image("onboard_\(selectedTab+1)")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack{
                HStack{
                    Spacer()
                    Button(action:{
                        sheetPresented.toggle()
                    }){
                        Text("Skip")
                            .font(.body)
                            .fontWeight(.semibold)
                    }
                   
                }.padding(.top, 20)
                    .padding(.trailing, 25)
                    .foregroundColor(.white)
                    
                
                
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding()
                
                TabView(selection: $selectedTab)
                {
                    OnboardItem(tab: $selectedTab, sheetPresented: $sheetPresented).tag(0)
                    OnboardItem(tab: $selectedTab, sheetPresented: $sheetPresented).tag(1)
                    OnboardItem(tab: $selectedTab, sheetPresented: $sheetPresented).tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(maxHeight: geo.size.height * 0.7)
                .padding(.horizontal, 37)
                .gesture(DragGesture(minimumDistance: 2, coordinateSpace: .local)
                    .onEnded({ value in
                        
                    }))
                
                
                
                Spacer()
            }
        }
           
        }
    }
}


struct OnboardItem: View {
    @Binding var tab : Int
    @Binding var sheetPresented: Bool
    private var onboardingContent: [ItemData]
    init(tab: Binding<Int>, sheetPresented: Binding<Bool>){
        self._tab = tab
        self._sheetPresented = sheetPresented
        onboardingContent = ItemData.getOnboardItem()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(onboardingContent[tab].title)
                .padding(.bottom, 30)
                .foregroundColor(.white)
                .padding(.vertical)
                .font(.title.bold())
            Text(onboardingContent[tab].text)
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.medium)
                .padding(.vertical)
            
            Spacer()
            Button(action:{
                if tab < (onboardingContent.count - 1) {
                    tab = tab + 1
                }else{
                    UserDefaults.standard.set(false, forKey: "FirstTimeUser")
                    sheetPresented.toggle()
                }
                
            }){
                Text("Next")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("onboard_btn"))
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    
            }
            .buttonStyle(.automatic)
            
            .padding(.bottom, 50)
        }
        
            
    }
}


struct ItemData{
    var title:String
    var text:String
    
    static func getOnboardItem() -> [ItemData]{
        return[
            ItemData(title: "Set your goal", text: "Set your goal to understanding what you need to make it happen, with us to guaide"),
            ItemData(title: "Trace the Progress", text: "More fun with trace your journey progress, to see your development"),
            ItemData(title: "Start with Us", text: "What makes you stop? start your journey here to see the new you")
        ]
    }
}

