//
//  DashboardView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/09.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct DashboardView: View {
    
    @State var optionSelected = 0
    @State var userIsLoggedIn: Bool = true
    @StateObject var vm = AuthManage()
    
    var body: some View {

        if userIsLoggedIn{
            content
        }else{
            LoginView()
        }
    }

    var content: some View{
        
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            VStack{
                if self.optionSelected == 0 {
                    
                    
                    HStack(spacing: 10){
                        Image("burgermenu")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(1)
                        
                            .frame(width: 35, height: 35, alignment: .center)
                        Spacer()
                        
                        Image("spotsearch")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(1)
                        
                            .frame(width: 35, height: 35, alignment: .center)
                        
                        Image("cart")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(1)
                            .frame(width: 35, height: 35, alignment: .center)
                        
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    Text("WELCOME BACK")
                        .font(.custom("Livvic-Regular", size: 12))
                        .foregroundColor(Color("Black"))
                        .padding(.leading, -170)
                        .padding(.top, 30)
                    
                    Text("JEANDRÈ")
                        .font(.custom("DreamAvenue", size: 40))
                        .foregroundColor(Color("Black"))
                        .padding(.leading, -170)
                        .padding(.top, 0)
                    
                    Text("TOP PRODUCT")
                        .font(.custom("Livvic-Regular", size: 12))
                        .foregroundColor(Color("Brown"))
                        .padding(.leading, -170)
                        .padding(.top, 30)
                    
                    HStack(spacing: 20){
                        
                        Image("SkinCreamery")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(10)
                            .frame(width: 300, height: 300)
                            .padding(.leading, -30)
                        
                        VStack(spacing: 30){
                      
                        AiTabBarView(optionSelected: self.$optionSelected)
                            
                            
                        }.padding(.leading, 10)
      
                    }
                    
                    Button(action: {
                        try? Auth.auth().signOut()
                    }, label: {
                        Text("Sign Out")
                    })
                    
                    
                }else if self.optionSelected == 1 {
                    ProfileView()
                    
                }else if self.optionSelected == 2 {
                    ProfileView()
                    
                }else if self.optionSelected == 3 {
                    ProfileView()
                    
                }else if self.optionSelected == 4 {
                    FaceScanView()
                
                }else if self.optionSelected == 5 {
                    DashboardView()

                }else if self.optionSelected == 5 {
                    ProfileView()
                }
            
                
                
                Spacer()
                TabBarView(optionSelected: self.$optionSelected)
            }
            .frame(width: getScreenBounds().width)
            .padding(.top, 10)
        }
        .onAppear{
            Auth.auth().addStateDidChangeListener{auth, user in
                if user == nil {
                    userIsLoggedIn.toggle()
                }
            }
        }
    }
 
    }



struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
        
    }
}
