//
//  BeautyDetailView.swift
//  Gloss
//
//  Created by Jeandré De Villiers on 2022/10/25.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI

struct BeautyDetailView: View {
    var beautyproduct : Beautyproducts
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
                    
                    
                    WebImage(url: URL(string:beautyproduct.image))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 200)
                }
                .padding(.top,
                         50)
                
                VStack(spacing: 20){
                    VStack{
                        Text(beautyproduct.name)
                            .font(.custom("Livvic-SemiBold", size: 20))
                            .foregroundColor(Color("Brown"))
                            .frame(width: 200, height: 100)
                        
                        Text(beautyproduct.subtitle)
                            .font(.custom("Livvic-Regular", size: 15))
                            .foregroundColor(Color("Brown"))
                            .frame(width: 200, height: 100)
                    }
                    .frame(width: 300, height: 100)
                    .frame(alignment: .center)
                    .ignoresSafeArea()
                        
                    HStack{
                        VStack{
                            
                            Text("Price")
                                .font(.custom("Livvic-Bold", size: 15))
                                .foregroundColor(Color("Black"))
                            
                            Text(String(beautyproduct.price))
                                .font(.custom("Livvic-Regular", size: 12))
                                .foregroundColor(Color("Black"))
                        }
                        
                        Spacer()
                            .frame(width: 200)
                        
                        VStack{
                            
                            Text("Size")
                                .font(.custom("Livvic-Bold", size: 15))
                                .foregroundColor(Color("White"))
                            
                           
                                Text(beautyproduct.size)
                                .font(.custom("Livvic-Regular", size: 12))
                                .foregroundColor(Color("Black"))
                            
                        }
                    }
                    .frame(width: 300, height: 100)
                    .frame(alignment: .center)
                    .ignoresSafeArea()
                }
                
                
                
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(spacing: 15){
                            
                            Button(action: {
                                //do filter
                                
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
                                //do filter
                                
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
                                //do filter
                                
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
                
                VStack{
                    
                    Text(beautyproduct.description)
                        .font(.custom("Livvic-Regular", size: 12))
                        .foregroundColor(Color("Brown"))
                        .opacity(0.9)
                       
                }
                .frame(width: 300, height: 100)
                .frame(alignment: .center)
                .ignoresSafeArea()
                
                Button(action: {
                   
                    
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("Brown"))
                            .frame(width: 350, height: 50)
                            .padding(.top, 20)
                            .padding(.leading, 10)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        
               
                                Text("Let's Shop!")
                                    .font(.custom("Livvic-SemiBoldItalic", size: 15))
                                    .foregroundColor(Color("White"))
                                    .padding(.top, 20)
                                    .multilineTextAlignment(.center)
                        
                                

                    }//ZStack
                   
                })//Button
                
                       
                
            } .padding(.leading, 10)
                .frame(alignment: .leading)
                .ignoresSafeArea()
            
            
        }.ignoresSafeArea()

    }
}

struct BeautyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeautyDetailView(beautyproduct: Beautyproducts(category: "", description: "", image: "", ingredients: "", name: "", price: 0, shades: 0, size: "", skintone: "", steps: [Steps(title: "", description: "", image: "")], subtitle: "", tutorial: "", wherebuy: ""))
    }
}
