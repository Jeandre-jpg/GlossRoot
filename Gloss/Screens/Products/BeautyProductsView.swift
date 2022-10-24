//
//  BeautyProductsView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/24.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct BeautyProductsView: View {
    
    @State var userIsLoggedIn: Bool = true

    
    var body: some View {
        ZStack{
            Color("Pink")
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                
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

            Image("spotsearch")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(1)
                .frame(width: 35, height: 35, alignment: .center)

            NavigationLink(destination:
                            BeautyProductsView()
                .navigationBarBackButtonHidden(true)){
                    Image("cart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(1)
                        .frame(width: 35, height: 35, alignment: .center)
                }
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Text("BASED ON YOUR")
                    .font(.custom("Livvic-Regular", size: 12))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -170)
                    .padding(.top, 30)
                
                Text("BEAUTY CARE")
                    .font(.custom("DreamAvenue", size: 40))
                    .foregroundColor(Color("Black"))
                    .padding(.leading, -75)
                    .padding(.top, 2)
                
                HStack{
                    
                    Text("ALL PRODUCTS")
                        .font(.custom("Livvic-SemiBold", size: 12))
                        .foregroundColor(Color("Brown"))
                        .padding(.leading, -160)
                        .padding(.top, 30)
                    
                    Text("(40)")
                        .font(.custom("Livvic-SemiBold", size: 12))
                        .foregroundColor(Color("Brown"))
                        .padding(.leading, -70)
                        .padding(.top, 30)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 15){
                        
                        Button(action: {
                            //do filter
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("FOUNDATION")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        Button(action: {
                            //do filter
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("LIPSTICK")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        
                        Button(action: {
                            //do filter
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("MASSCARA")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        Button(action: {
                            //do filter
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("KITS")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        
                        
                        Button(action: {
                            //do filter
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("POWDER")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                        
                        
                        
                        Button(action: {
                            //do filter
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color("MediumLight"))
                                    .frame(width: 100, height: 35)
                                    .padding(.top, 1)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                Text("EYESHADOW")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                    .foregroundColor(Color("Black"))
                                    .padding(.top, 1)
                                    .multilineTextAlignment(.center)
                            }//ZStack
                        })//Button
                    }  .padding(.leading, 30)
                        .padding(.bottom, 20)
                        .padding(.top, 10)
                }
                ScrollView{
                    HStack(spacing: 20){
                        
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color("White"))
                                    .frame(width: 160, height: 160)
                                    .padding(.top, 20)
                                    .opacity(0.5)
                                
                                Image("Google")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 160, height: 160)
                                    .padding(.leading, 20)
                                
                                
                            }
                            
                            Text("Log In")
                                .font(.custom("Livvic-SemiBold", size: 15))
                                .foregroundColor(Color("Black"))
                                .padding(.top, 10)
                                .padding(.leading, -70)
                            
                            Text("Log In")
                                .font(.custom("Livvic-Regular", size: 15))
                                .foregroundColor(Color("Black"))
                                .padding(.top, -10)
                                .padding(.leading, -70)
                        }
                        
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color("White"))
                                    .frame(width: 160, height: 160)
                                    .padding(.top, 20)
                                    .opacity(0.5)
                                
                                Image("Google")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 160, height: 160)
                                    .padding(.leading, 20)
                                
                                
                            }
                            
                            Text("Log In")
                                .font(.custom("Livvic-SemiBold", size: 15))
                                .foregroundColor(Color("Black"))
                                .padding(.top, 10)
                                .padding(.leading, -70)
                            
                            Text("Log In")
                                .font(.custom("Livvic-Regular", size: 15))
                                .foregroundColor(Color("Black"))
                                .padding(.top, -10)
                                .padding(.leading, -70)
                        }
                        
                        
                        
                    }
                }
            }
        }
    }
}

struct BeautyProductsView_Previews: PreviewProvider {
    static var previews: some View {
        BeautyProductsView()
    }
}
