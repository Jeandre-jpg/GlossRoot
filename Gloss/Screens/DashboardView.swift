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
    @State var beauty: Beauty
    
    
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
                            
                            
                            Button(action: {
                                try? Auth.auth().signOut()
                            }, label: {
                                Image("logout")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .padding(1)
                                    .frame(width: 35, height: 35, alignment: .center)
                            })
                            
                            Spacer()
                            
                            Image("LogoMain")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70, alignment: .leading)
                            
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                        .padding(.top, -20)
                   
                    
                    
                    
                    Text("WELCOME BACK")
                        .font(.custom("Livvic-Regular", size: 12))
                        .foregroundColor(Color("Black"))
                        .padding(.leading, -170)
                        .padding(.top, 10)
                    
                    Text(beauty.username)
                        .font(.custom("DreamAvenue", size: 40))
                        .foregroundColor(Color("Black"))
                        .padding(.leading, -170)
                        .padding(.top, 5)
                    
                    Text("TOP PRODUCT")
                        .font(.custom("Livvic-Regular", size: 12))
                        .foregroundColor(Color("Brown"))
                        .padding(.leading, -170)
                        .padding(.top, -10)
                    
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
                    
                    
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("White"))
                                .frame(width: 370, height: 180)
                                .padding(.top, 10)
                   
                            HStack{
                                Text("Skin Creamery Slow Beauty Collection")
                                    .font(.custom("Livvic-Regular", size: 17))
                                    .foregroundColor(Color("Brown"))
                                    .padding(.leading, -2)
                                    .padding(.top, -60)
                              
                                NavigationLink(destination:
                                                BeautyProductsView()
                                    .navigationBarBackButtonHidden(true)){
                                        Image("eye")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .padding(1)
                                            .frame(width: 25, height: 25, alignment: .center)
                                            .padding(.top, -65)
                                            .padding(.leading, 15)
                                    }
                            }
                            
                            Text("This set contains: 1x 15ml Wildflower Water-Cream (a multipurpose beauty elixir), 1x 15ml Facial Hydrating Oil (an omega elixir, for dewy, radiant skin) and a 1x 15ml Deep Cleansing Powder (cleanses and purifies from deep within pores without drying the skin).")
                                .font(.custom("Livvic-Regular", size: 12))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, -20)
                                .padding(.top, 20)
                                .frame(width: 300)
                            
                            Image("rating")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(1)
                                .frame(width: 15, height: 15, alignment: .center)
                                .padding(.top, 130)
                                .padding(.leading, 215)
                        }
                        
                    }
                    .padding(.top, -10)
           

                    
                }else if self.optionSelected == 1 {
                    SkinProductsView()
                    
                }else if self.optionSelected == 2 {
                    BeautyProductsView()
                    
                }else if self.optionSelected == 3 {
                    EditView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
                    
                }else if self.optionSelected == 4 {
                    FaceScanView()
                
                }else if self.optionSelected == 5 {
//                    DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))

                }else if self.optionSelected == 6 {
                   FaceFilterView()
                }
            
                
                
                Spacer()
                TabBarView(optionSelected: self.$optionSelected)
            }
            .frame(width: getScreenBounds().width)
            .padding(.top, 10)
        }
        .onAppear{

            FirestoreViewModel.fetchUser(uid: Auth.auth().currentUser?.uid ?? "", onSuccess: {user in
                self.beauty = user
            })

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
        DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
        
    }
}
