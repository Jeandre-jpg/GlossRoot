//
//  EditView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/16.
//

import SwiftUI

struct EditView: View {
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var age: Int = 1
    @State private var gender: Array = ["Female", "Male", "Transgender", "Gender Neutral", "Non-binary", "Agender", "Other"]
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var selectedIndex = 0
    @State var offset: CGFloat = 0
    @State private var skintype = 0
    @State private var skintone = 0
    @State private var skinconcern = 0
    
    var body: some View {
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            VStack(spacing: 8){
                Button{
                    offset = min(offset + getScreenBounds().width * 2,
                                 getScreenBounds().width * 2)
                }label: {
                    NavigationLink(destination:
                                    ProfileView()
                        .navigationBarBackButtonHidden(true)){
                            Image("back")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.leading, -170)
                                .frame(width: 25, height: 25)
                                .padding(.top, -40)
                        }
                }
                
                Text("EDIT")
                    .font(.custom("DreamAvenue", size: 40))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, -10)
                    .padding(.bottom, -10)
                
                
                Image("LogoMain")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200, alignment: .center)
                
                Text("Your Information")
                    .font(.custom("DreamAvenue", size: 20))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, 0)
                
                HStack(spacing: 10){
                    
                    VStack{
                        
                        Text("Firstname *")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -75)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(username)
                                .font(.custom("Livvic-Medium", size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, 10)
                                .frame(width: 75, height: 15)
                            
                            
                        }
                        
                        .frame(width: 120, height: 15)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        
                        
                    }
                    
                    
                    
                    VStack{
                        
                        Text("Surname")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -70)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(surname)
                                .font(.custom("Livvic-Medium", size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, 10)
                                .frame(width: 75, height: 15)
                            
                            
                            
                        }
                        
                        .frame(width: 120, height: 15)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        
                        
                    }
                    
                    
                }
                
                
                .padding(.top, 5)
                .padding(.leading, -20)
                .padding(.bottom, -5)
                
                
                
                Text("Email Adress *")
                    .font(.custom("Livvic-Medium", size: 15))
                    .foregroundColor(Color("Brown"))
                    .padding(.top, 5)
                    .padding(.leading, -170)
                    .padding(.bottom, -10)
                
                
            TextField("Email Adress", text: $email)
                    .font(.custom("Livvic-Medium", size: 12))
                    .foregroundColor(Color("Black"))
                    .multilineTextAlignment(.leading)
                    .padding(.all, 20)
                    .border(Color("Grey"))
                    .opacity(0.7)
                    .frame(width: 350, height: 70)
                
                HStack(spacing: 10){
                    
                    VStack{
                        
                        Text("Gender *")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -75)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(String(gender[selectedIndex]))
                                .font(.custom("Livvic-Medium", size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, 10)
                                .frame(width: 75, height: 15)
                            
                            
                        }
                        
                        .frame(width: 120, height: 15)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        
                        
                    }
                    
                    
                    
                    VStack{
                        
                        Text("Age *")
                            .font(.custom("Livvic-Medium", size: 15))
                            .foregroundColor(Color("Brown"))
                            .padding(.top, 5)
                            .padding(.leading, -70)
                            .padding(.bottom, -5)
                        
                        HStack{
                            
                            
                            Text(String(age))
                                .font(.custom("Livvic-Medium", size: 15))
                                .foregroundColor(Color("Brown"))
                                .padding(.leading, 10)
                                .frame(width: 75, height: 15)
                            
                            
                            
                        }
                        
                        .frame(width: 120, height: 15)
                        .padding(.all, 20)
                        .border(Color("Grey"))
                        .opacity(0.7)
                        
                        
                    }
                    
                    
                }
                
                
                .padding(.top, -5)
                .padding(.leading, -20)
    
                
                Text("Skin Types *")
                    .font(.custom("Livvic-Medium", size: 15))
                    .foregroundColor(Color("Brown"))
                    .padding(.top, 10)
                    .padding(.leading, -170)
                    .padding(.bottom, -10)
                
                
                Text(String(skintype))
                    .font(.custom("Livvic-Medium", size: 15))
                    .foregroundColor(Color("Brown"))
                    .frame(width: 300, height: 15)
                    .padding(.all, 20)
                    .border(Color("Grey"))
                    .opacity(0.7)
                    .padding(.top, 10)
                

                
                
            }//Button
            .padding(.top, -50)
            
            
            VStack(spacing: 10){
                
                Spacer()
                
                
                Button{
                    offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                    
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("Brown"))
                            .frame(width: 350, height: 50)
                            .padding(.top, 20)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        
                        
                        Text("Save")
                            .font(.custom("Livvic-SemiBoldItalic", size: 15))
                            .foregroundColor(Color("White"))
                            .padding(.top, 20)
                            .multilineTextAlignment(.center)
                        
                        
                    }//ZStack
                    
                }//Button
                
                .disabled(username.isEmpty || password.isEmpty )
            }
        }//VStack
        
    }
    
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}