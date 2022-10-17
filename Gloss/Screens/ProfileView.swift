//
//  ProfileView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/15.
//

import SwiftUI

struct ProfileView: View {
    
    
//    @State var user: User
    @State var optionSelected = 3
    @State var offset: CGFloat = 0
    
//    @AppStorage("userId") var userId: String = ""
    
    
    var body: some View {
            
            ZStack{
                Color("Pink")
                    .ignoresSafeArea()
                
            VStack{

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
                    
                    Spacer()
                        .frame(height: 50)
                        
                        Text("PROFILE")
                            .font(.custom("DreamAvenue", size: 40))
                            .foregroundColor(Color("Black"))
                            .padding(.leading, -170)
                            .padding(.top, 0)

ZStack{
    RoundedRectangle(cornerRadius: 30)
        .fill(Color("White"))
        .frame(width: 350, height: 200)
        .padding(.top, 10)
    
    HStack{
        
        Image("logoWhite")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100, alignment: .center)
            .padding(.leading, 10)
            .padding(.top, -50)
        
        VStack{
            Text("Jeandrè")
                .font(.custom("Livvic-Medium", size: 30))
                .foregroundColor(Color("Black"))
                .padding(10)
                .padding(.leading, -20)
                .padding(.top, 20)
            
            Text("jeandre@gmail.com")
                .font(.custom("Livvic-Regular", size: 12))
                .foregroundColor(Color("Brown"))
                .padding(.leading, -10)
                .padding(.top, -10)
            
          
          
                NavigationLink(destination:
                                EditView()
                    .navigationBarBackButtonHidden(true)){
               
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("Brown"))
                                .frame(width: 200, height: 50)
                                .padding(.top, 20)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                            
                         
                                    Text("Edit Account")
                                        .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                        .foregroundColor(Color("White"))
                                        .padding(.top, 20)
                                        .multilineTextAlignment(.center)
                                    
                              
                        }//ZStack
                    }//Nav
        
        }
    }
        
}
    
    Button{
        offset = min(offset + getScreenBounds().width * 2,
                     getScreenBounds().width * 2)
    }label: {
        NavigationLink(destination:
                        BoardingRegister()
            .navigationBarBackButtonHidden(true)){
       
                ZStack{
                    
                    VStack{
                        HStack(spacing: 50){
                            
                            Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, 10)
                                .frame(width: 50, height: 50)
                            
                            
                            Text("Skin Profile")
                                .font(.custom("Livvic-Medium", size: 20))
                                .foregroundColor(Color("Black"))
                                .padding(.top, 12)
                                .padding(.leading, -40)
                            
                            Text(">")
                                .offset(y: 5)
                                .font(.custom("Livvic-Bold", size: 20))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, 100)
                            
                            
                            
                        }
                        .padding(.top, 5)
                        .padding(.leading, -20)
                        .frame(width: 350)
                        
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color("Brown"))
                            .frame(height: 3)
                            .frame(width: 320)
                            .padding(.leading, 10)
                    }
                            
                      
                }//ZStack
              
            
            }//Nav
    }//Button
                
    Button{
        offset = min(offset + getScreenBounds().width * 2,
                     getScreenBounds().width * 2)
    }label: {
        NavigationLink(destination:
                        BoardingRegister()
            .navigationBarBackButtonHidden(true)){
       
                ZStack{
                    
                    VStack{
                        HStack(spacing: 50){
                            
                            Image("medical")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, 10)
                                .frame(width: 30, height: 30)
                            
                            
                            Text("Health Records")
                                .font(.custom("Livvic-Medium", size: 20))
                                .foregroundColor(Color("Black"))
                                .padding(.top, 12)
                                .padding(.leading, -40)
                            
                            Text(">")
                                .offset(y: 5)
                                .font(.custom("Livvic-Bold", size: 20))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, 70)
                            
                            
                            
                        }
                        .padding(.top, 5)
                        .padding(.leading, 0)
                        .frame(width: 350)
                        
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color("Brown"))
                            .frame(height: 3)
                            .frame(width: 320)
                            .padding(.leading, 10)
                    }
                            
                      
                }//ZStack
              
            
            }//Nav
    }//Button
                
                Button{
                    offset = min(offset + getScreenBounds().width * 2,
                                 getScreenBounds().width * 2)
                }label: {
                    NavigationLink(destination:
                                    BoardingRegister()
                        .navigationBarBackButtonHidden(true)){
                   
                            ZStack{
                                
                                VStack{
                                    HStack(spacing: 50){
                                        
                                        Image("settings")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.top, 10)
                                            .frame(width: 40, height: 40)
                                        
                                        
                                        Text("Settings")
                                            .font(.custom("Livvic-Medium", size: 20))
                                            .foregroundColor(Color("Black"))
                                            .padding(.top, 12)
                                            .padding(.leading, -40)
                                        
                                        Text(">")
                                            .offset(y: 5)
                                            .font(.custom("Livvic-Bold", size: 20))
                                            .foregroundColor(Color("Brown"))
                                            .padding(.leading, 135)
                                        
                                        
                                        
                                    }
                                    .padding(.top, 5)
                                    .padding(.leading, -20)
                                    .frame(width: 450)
                                    
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(Color("Brown"))
                                        .frame(height: 3)
                                        .frame(width: 320)
                                        .padding(.leading, 10)
                                }
                                        
                                  
                            }//ZStack
                          
                        
                        }//Nav
                }//Button
                
                
                Button{
                    offset = min(offset + getScreenBounds().width * 2,
                                 getScreenBounds().width * 2)
                }label: {
                    NavigationLink(destination:
                                    BoardingRegister()
                        .navigationBarBackButtonHidden(true)){
                   
                            ZStack{
                                
                                VStack{
                                    HStack(spacing: 50){
                                        
                                        Image("logout")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.top, 10)
                                            .frame(width: 40, height: 40)
                                        
                                        
                                        Text("Logout")
                                            .font(.custom("Livvic-Medium", size: 20))
                                            .foregroundColor(Color("Black"))
                                            .padding(.top, 12)
                                            .padding(.leading, -40)
                                        
                                        Text(">")
                                            .offset(y: 5)
                                            .font(.custom("Livvic-Bold", size: 20))
                                            .foregroundColor(Color("Brown"))
                                            .padding(.leading, 140)
                                        
                                        
                                        
                                    }
                                    .padding(.top, 5)
                                    .padding(.leading, -20)
                                    .frame(width: 450)
                                    
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(Color("Brown"))
                                        .frame(height: 3)
                                        .frame(width: 320)
                                        .padding(.leading, 10)
                                }
                                        
                                  
                            }//ZStack
                          
                        
                        }//Nav
                }//Button

              
            } .frame(width: getScreenBounds().width)
                 
                
//            .onAppear(perform: {
//                FirestoreService.fetchUser(uid: userId, onSuccess: {user in
//                    self.user = user
//                })
//            })
                
        }
            
 
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileView()
        
//        ProfileView(user: User(userName: "", email: "", posts: [], followers: 0, following: 0, bio: "", imageUrl: ""))
    }
}
