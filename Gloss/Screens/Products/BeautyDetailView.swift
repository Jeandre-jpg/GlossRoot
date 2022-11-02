//
//  BeautyDetailView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/11/02.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI
import AVKit

struct BeautyDetailView: View {
    @State private var showingCredits = false
    @State private var infoFilter: String = "Description"
    @ObservedObject private var beautyproduct = BeautyproductsViewModel()
    var beautyproduct2 : Beautyproducts
    
    var body: some View {
        
                ZStack{
                    Color("Pink")
                        .ignoresSafeArea()
                    
                VStack{
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color("White"))
                            .frame(width: 400, height: 300)
                            .opacity(1)
                        
                        
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
                            
                            ZStack{
                                NavigationLink(destination:
                                                DashboardView(beauty: Beauty(name: "", surname: "", age: 0, email: "", gender: "", skinconcern: 0, skintone: 0, skintype: 0, username: ""))
                                    .navigationBarBackButtonHidden(true)){
                                        
                                        Image("back")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 35, height: 10, alignment: .center)
                                          
                                        
                                    }
                                
                            }.offset(x: -20, y: -1)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.top, -100)
                        
                        
                            
                            
                            WebImage(url: URL(string:beautyproduct2.image))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 200)
                        }
                        .padding(.top,
                                 -10)
                        
                        VStack(spacing: 20){
                            VStack{
                                Text(beautyproduct2.name)
                                    .font(.custom("Livvic-SemiBold", size: 25))
                                    .foregroundColor(Color("Brown"))
                                    .frame(width: 350, height: 100)
                                    .padding(.leading, -100)
                                    .padding(.top, 90)
                                
                                Text(beautyproduct2.subtitle)
                                    .font(.custom("Livvic-Regular", size: 15))
                                    .foregroundColor(Color("Brown"))
                                    .frame(width: 350, height: 100)
                                    .padding(.leading, -30)
                                    .padding(.top, -10)
                            }
                            .frame(width: 300, height: 100, alignment: .leading)
                            .frame(alignment: .center)
                            .ignoresSafeArea(.all)
                            
                            
                            HStack(spacing: 10){
                                Rectangle()
                                    .fill(Color("Grey"))
                                    .frame(height: 1)
                                    .frame(width: 350)
                                    .padding(.trailing)
                                    .padding(.top, 100)
                            }
                                
                            HStack{
                                VStack{
                                    
                                    Text("Price")
                                        .font(.custom("Livvic-Bold", size: 20))
                                        .foregroundColor(Color("Black"))
                                    
                                    Text(String("R \(beautyproduct2.price).00"))
                                        .font(.custom("Livvic-Regular", size: 15))
                                        .foregroundColor(Color("Black"))
                                        .padding(.top, 1)
                                }
                                
                                Spacer()
                                    .frame(width: 200)
                                
                                VStack{
                                    
                                    Text("Size")
                                        .font(.custom("Livvic-Bold", size: 20))
                                        .foregroundColor(Color("Black"))
                                    
                                   
                                        Text(beautyproduct2.size)
                                        .font(.custom("Livvic-Regular", size: 15))
                                        .foregroundColor(Color("Black"))
                                        .padding(.top, 1)
                                    
                                }
                            }
                            .padding(.top, -30)
                            .padding(.leading, -60)
                            .frame(width: 300, height: 100)
                            .frame(alignment: .center)
                            .ignoresSafeArea()
                        }
                        
                        HStack(spacing: 10){
                            Rectangle()
                                .fill(Color("Grey"))
                                .frame(height: 1)
                                .frame(width: 350)
                                .padding(.trailing)
                                .padding(.top, -10)
                        }
                            
                        
                      
                        
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                HStack(spacing: 15){
                                    
                                    Button(action: {
                                       infoFilter = "Description"
                                        
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(Color("Brown"))
                                                .frame(width: 100, height: 35)
                                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                            Text("DETAILS")
                                                .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                                .foregroundColor(Color("White"))
                                                
                                                .multilineTextAlignment(.center)
                                        }//ZStack
                                    })//Button
                                    
                                    Button(action: {
                                      infoFilter  = "Tutorial"
                                        
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(Color("Brown"))
                                                .frame(width: 100, height: 35)
                                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                            Text("TUTORIAL")
                                                .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                                .foregroundColor(Color("White"))
                                                
                                                .multilineTextAlignment(.center)
                                        }//ZStack
                                    })//Button
                                    
                                    
                                    Button(action: {
                                       infoFilter = "Ingredients"
                                        
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(Color("Brown"))
                                                .frame(width: 100, height: 35)
                                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                                            Text("INGREDIENTS")
                                                .font(.custom("Livvic-SemiBoldItalic", size: 12))
                                                .foregroundColor(Color("White"))
                                                
                                                .multilineTextAlignment(.center)
                                        }//ZStack
                                    })//Button
                                }
                                .padding(.leading, 30)
                                   .padding(.bottom, 20)
                                   .padding(.top, 30)
                                
                           
                               
                            }
                        
                            .padding(.top, -30)
                        
                        if infoFilter == "Description" {
                            VStack{
                                
                                Text(beautyproduct2.description)
                                    .font(.custom("Livvic-Regular", size: 12))
                                    .foregroundColor(Color("Brown"))
                                    .opacity(0.9)
                                   
                            }
                            .frame(width: 350, height: 100)
                            .frame(alignment: .center)
                            .ignoresSafeArea()
                        }else if infoFilter == "Tutorial" {
                            VStack{
                              
                                
                                Text(beautyproduct2.tutorial)
                                    .font(.custom("Livvic-Regular", size: 12))
                                    .foregroundColor(Color("Brown"))
                                    .opacity(0.9)
                                   
                            }
                            .frame(width: 350, height: 100)
                            .frame(alignment: .center)
                            .ignoresSafeArea()
                        }else if infoFilter == "Ingredients" {
                            VStack{
                                
                                Text(beautyproduct2.ingredients)
                                    .font(.custom("Livvic-Regular", size: 12))
                                    .foregroundColor(Color("Brown"))
                                    .opacity(0.9)
                                   
                            }
                            .frame(width: 350, height: 100)
                            .frame(alignment: .center)
                            .ignoresSafeArea()
                        }
                        
                        
                               
                        
                    } .padding(.leading, 10)
                        .frame(alignment: .leading)
                        .ignoresSafeArea()
                    
                    
                }.ignoresSafeArea()

            }
        }

struct BeautyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeautyDetailView(beautyproduct2: Beautyproducts(category: "", description: "", image: "", ingredients: "", name: "", price: 0, shades: 0, size: "", skintone: "", steps: [Steps(title: "", description: "", image: "")], subtitle: "", tutorial: "", wherebuy: ""))
    }
}
