//
//  Splash.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/02.
//

import SwiftUI
struct SplashView: View {
    @State private var isActive = false
    @AppStorage("Boarding") var isOnboarding: Bool = true
    
    var body: some View {
        
        
        if isActive{
            if isOnboarding{
                OnboardingView()
            }else{
                LoginView()
            }
            
        }else{
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            VStack{
                
                Image("LogoMain")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300, alignment: .center)
            
            Text("Gloss")
                .font(.custom("DreamAvenue", size: 70))
                .foregroundColor(Color("Black"))
                .multilineTextAlignment(.center)
                .padding(20)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 2)
                    .padding(.top, -30)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                withAnimation{
                    self.isActive = true
                }
            }
        }
        }
}
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
